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
