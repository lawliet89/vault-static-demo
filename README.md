# vault-static-demo

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 2.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 2.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_service_account.roleset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account.vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.static](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_service_account_key.vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [vault_generic_endpoint.static](https://registry.terraform.io/providers/hashicorp/vault/2.21.0/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.vault](https://registry.terraform.io/providers/hashicorp/vault/2.21.0/docs/resources/generic_endpoint) | resource |
| [vault_mount.gcp](https://registry.terraform.io/providers/hashicorp/vault/2.21.0/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_secret_path"></a> [gcp\_secret\_path](#input\_gcp\_secret\_path) | Path in Vault to mount | `string` | `"gcp-static-test"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Google Project ID | `string` | n/a | yes |
| <a name="input_roleset_service_account"></a> [roleset\_service\_account](#input\_roleset\_service\_account) | Service account for roleset | `string` | `"static-roleset-test"` | no |
| <a name="input_roleset_static"></a> [roleset\_static](#input\_roleset\_static) | Name of static account 'roleset' | `string` | `"test"` | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | Vault Address | `string` | n/a | yes |
| <a name="input_vault_service_account"></a> [vault\_service\_account](#input\_vault\_service\_account) | GCP Service account for mount | `string` | `"static-test-vault"` | no |

## Outputs

No outputs.
