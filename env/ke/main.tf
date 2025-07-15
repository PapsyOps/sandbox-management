terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

module "storage" {
  source              = "../../module/storage_account"
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
  account_tier        = var.account_tier
  replication_type    = var.replication_type
  kind                = var.kind
  tags                = var.tags
}
