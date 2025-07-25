terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.37.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = "2975b020-f54c-42da-9650-b31c9108635a"
}


module "rg-Pam" {
  source              = "../../module/resource_group"
  resource_group_name = "TZ-RG-EUW-ITS-Test"
  location            = "West Europe"
  tags = {
    "ke-app-name"             = "tzinfra"
    "ke-app-cost-owner"       = "anjombe@kpmg.co.tz"
    "ke-app-department"       = "ITS"
    "ke-app-business-unit"    = "CSU"
    "ke-app-budget"           = "$800"
    "ke-app-environment"      = "Development"
    "ke-app-tech-contact"     = "psimon@kpmg.co.tz"
    "ke-app-end-of-life-date" = "2025-12-31"
  }

}

module "rg-Rich" {
  source              = "../../module/resource_group"
  resource_group_name = "KE-RG-EUW-IDAS-Moodle"
  location            = "West Europe"
  tags = {
    "ke-app-name"             = "idaslms"
    "ke-app-cost-owner"       = "ssanghrajka@kpmg.co.ke"
    "ke-app-department"       = "IDAS"
    "ke-app-business-unit"    = "IDAS"
    "ke-app-budget"           = "$1000"
    "ke-app-environment"      = "Development"
    "ke-app-tech-contact"     = "jnjihia@kpmg.co.ke, richardmwangi@kpmg.co.ke"
    "ke-app-end-of-life-date" = "Never"
  }

}

module "func_app" {
  source                        = "../../module/function_app"
  existing_resource_group_name  = var.existing_resource_group_name
  location                      = var.location
  existing_storage_account_name = var.existing_storage_account_name
  function_app_name             = var.function_app_name
  app_service_plan_name         = var.app_service_plan_name
  sku_name                      = var.sku_name
  os_type                       = var.os_type
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  tags = {
    "ke-app-backup" = "Yes"
  }

}
