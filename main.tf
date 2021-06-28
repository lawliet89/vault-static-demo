provider "vault" {
  address = var.vault_address
}

provider "google" {
  project = var.project_id
}

resource "vault_mount" "gcp" {
  path        = var.gcp_secret_path
  type        = var.mount_type
  description = "GCP Secrets Engine for static test"
}

locals {
  gcp_config_data = jsonencode({
    # field "credentials": '' expected type 'string'
    credentials = base64decode(google_service_account_key.vault.private_key)
    ttl         = 3600
    max_ttl     = 14400
  })
}

# Service account for GCP secrets Engine
resource "google_service_account" "vault" {
  account_id   = var.vault_service_account
  display_name = "GCP Static Test Vault"
}

resource "google_service_account_key" "vault" {
  service_account_id = google_service_account.vault.name
}

resource "vault_generic_endpoint" "vault" {
  path                 = "${vault_mount.gcp.path}/config"
  ignore_absent_fields = true

  disable_delete = true

  data_json = local.gcp_config_data
}

# Service account for static roleset
resource "google_service_account" "roleset" {
  account_id   = var.roleset_service_account
  display_name = "GCP Static Roleset"
}

# Give Vault service account permission to use the static service account
resource "google_service_account_iam_member" "static" {
  service_account_id = google_service_account.roleset.name
  role               = "roles/iam.serviceAccountKeyAdmin"
  member             = "serviceAccount:${google_service_account.vault.email}"
}

# Create static roleset
resource "vault_generic_endpoint" "static" {
  path                 = "${vault_mount.gcp.path}/static/${var.roleset_static}"
  ignore_absent_fields = true

  data_json = jsonencode({
    secret_type           = "service_account_key"
    service_account_email = google_service_account.roleset.email
  })
}

# vault read gcp-static-test/static/test/key
