provider "azurerm" {
  features {}
}

module "ug_rg" {
  source              = "../../module/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

}

module "ug_storage" {
  source              = "../../module/storage_account"
  name                = var.storage_account_name
  resource_group_name = module.ug_rg.resource_group_name
  location            = var.location
  account_tier        = var.account_tier
  replication_type    = var.account_replication_type
  tags                = var.tags
}
