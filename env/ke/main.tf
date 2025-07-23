terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # version = "~> 3.99.0"
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


module "rg" {
  source   = "../../module/resource_group"
  name     = "KE-RG-CH-TZ-Test"
  location = "West Europe"
}

module "func_app" {
  source                  = "../../module/function_app"
  resource_group_name     = "KE-RG-EUW-IDAS-LMS"
  location                = "West Europe"
  storage_account_name    = "idastranslatorfiles"
  function_app_name       = "idastranslatorfunction"
  app_service_plan_name   = "plan-func-ke"
}
