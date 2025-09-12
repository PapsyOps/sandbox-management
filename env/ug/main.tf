terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # allow any 3.x ≥ 3.66 (which has immutability & legal hold support)
      version = ">= 4.35"
    }
  }
}
 
provider "azurerm" {
  features {}
#   subscription_id = "2975b020-f54c-42da-9650-b31c9108635a"
#   tenant_id       = "c8b38f7c-553a-4eab-aad1-2a835c934033"
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
