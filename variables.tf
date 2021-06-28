variable "vault_address" {
  description = "Vault Address"
  type        = string
}

variable "project_id" {
  description = "Google Project ID"
  type        = string
}

variable "vault_service_account" {
  description = "GCP Service account for mount"
  type        = string
  default     = "static-test-vault"
}

variable "gcp_secret_path" {
  description = "Path in Vault to mount"
  type        = string
  default     = "gcp-static-test"
}

variable "roleset_service_account" {
  description = "Service account for roleset"
  type        = string
  default     = "static-roleset-test"
}

variable "roleset_static" {
  description = "Name of static account 'roleset'"
  type        = string
  default     = "test"
}
