```hcl
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_management_lock" "rg_lock" {
  count      = var.lock_level != null && var.lock_level != "" ? 1 : 0
  name       = "lock-${var.rg_name}"
  scope      = azurerm_resource_group.rg.id
  lock_level = var.lock_level
  notes      = "Resource Group '${var.rg_name}' is locked with '${var.lock_level}' level."
}
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_lock.rg_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Location (region) this resource should be put in (ie: uksouth) | `string` | n/a | yes |
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | Specifies the Lock Level to be used, possibly values are Empty (no lock), `CanNotDelete` and `ReadOnly`. | `string` | `null` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the Resource Group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the Tags to use on the resources that are deployed with this module | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rg_id"></a> [rg\_id](#output\_rg\_id) | Resource group generated id |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | Resource group location (region) |
| <a name="output_rg_lock_id"></a> [rg\_lock\_id](#output\_rg\_lock\_id) | The id of the resource group lock |
| <a name="output_rg_lock_level"></a> [rg\_lock\_level](#output\_rg\_lock\_level) | The lock-level of the resource group lock |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | The name of the resource group |
| <a name="output_rg_tags"></a> [rg\_tags](#output\_rg\_tags) | The tags of the resource group |
