```hcl
module "rg" {
  source = "git::https://github.com/cybear-devops/terraform-azurerm-resource-group.git"

  name     = "rg-${var.short}-${var.loc}-${var.env}-001"
  location = local.location
  tags     = local.tags
  #lock_level = "ReadOnly" // Do not set this value to skip lock
}
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.98.0 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.3 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rg"></a> [rg](#module\_rg) | git::https://github.com/cybear-devops/terraform-azurerm-resource-group.git | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current_creds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.mgmt_kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.mgmt_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_ssh_public_key.mgmt_ssh_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/ssh_public_key) | data source |
| [azurerm_user_assigned_identity.mgmt_user_assigned_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/user_assigned_identity) | data source |
| [external_external.detect_os](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.generate_timestamp](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [http_http.client_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Environments"></a> [Environments](#input\_Environments) | Converts the Shorthand Environment Name to Longhand Environment Name via lookup on map list | `map(string)` | <pre>{<br>  "dev": "Development",<br>  "ppe": "Pre-Production",<br>  "prd": "Production",<br>  "tst": "Test"<br>}</pre> | no |
| <a name="input_Regions"></a> [Regions](#input\_Regions) | Converts the Shorthand Region Name to Longhand Region Name via lookup on map list | `map(string)` | <pre>{<br>  "eus": "East US",<br>  "euw": "West Europe",<br>  "uks": "UK South",<br>  "ukw": "UK West"<br>}</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | The Shorthand Environment name for the Resource (ie: prd = production, ppe = pre-production) | `string` | `"prd"` | no |
| <a name="input_loc"></a> [loc](#input\_loc) | The Shorthand Name of the Azure Region (ie: uks = UK South, ukw = UK West) | `string` | `"uks"` | no |
| <a name="input_short"></a> [short](#input\_short) | The Shorthand Name for the Project (ie: hw = hello-world, cdo = cybear-devops) | `string` | `"cdo"` | no |
| <a name="input_static_tags"></a> [static\_tags](#input\_static\_tags) | The tags variable | `map(string)` | <pre>{<br>  "Contact": "cybear-devops@btinternet.com",<br>  "CostCentre": "112233",<br>  "ManagedBy": "Terraform",<br>  "Owner": "cybear-devops",<br>  "ServiceCategory": "A"<br>}</pre> | no |

## Outputs

No outputs.
