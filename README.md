```hcl
resource "azurerm_resource_group" "rg" {
  name       = var.name
  location   = var.location
  managed_by = var.managed_by
  tags       = var.tags
}

resource "azurerm_management_lock" "rg_lock" {
  count      = var.lock_level != null && var.lock_level != "" ? 1 : 0
  name       = "lock-${var.name}"
  scope      = azurerm_resource_group.rg.id
  lock_level = var.lock_level
  notes      = "Resource '${var.name}' is locked with '${var.lock_level}' level"
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
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Resource should exist (ie: UK South) | `string` | n/a | yes |
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | (Required) Specifies the Level to be used for this Lock. Possibly values are Empty (no lock), `CanNotDelete` and `ReadOnly` | `string` | `null` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | (Optional) The ID of the resource or application that manages this Resource | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The Name which should be used for this Resource | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Resource | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rg_id"></a> [rg\_id](#output\_rg\_id) | Resource group generated id |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | Resource group location (region) |
| <a name="output_rg_lock_id"></a> [rg\_lock\_id](#output\_rg\_lock\_id) | The id of the resource group lock |
| <a name="output_rg_lock_level"></a> [rg\_lock\_level](#output\_rg\_lock\_level) | The lock-level of the resource group lock |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | The name of the resource group |
| <a name="output_rg_tags"></a> [rg\_tags](#output\_rg\_tags) | The tags of the resource group |
