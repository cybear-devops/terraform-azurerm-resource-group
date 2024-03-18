module "rg" {
  source = "git::https://github.com/cybear-devops/terraform-azurerm-resource-group.git"

  rg_name  = "rg-${var.short}-${var.loc}-${var.env}-01"
  location = local.location
  tags     = local.tags

  #  lock_level = "ReadOnly" // Do not set this value to skip lock
}