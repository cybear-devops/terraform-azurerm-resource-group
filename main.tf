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
