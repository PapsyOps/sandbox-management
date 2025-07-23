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
  source   = "../../module/resource_group"
  name     = "KE-RG-CH-TZ-Test"
  location = "West Europe"
  tags = {
    "ke-app-name"             = "tztests"
    "ke-app-cost-owner"       = "anjombe@kpmg.co.tz"
    "ke-app-department"       = "CSU"
    "ke-app-business-unit"    = "ITS"
    "ke-app-budget"           = "$1000"
    "ke-app-environment"      = "Development"
    "ke-app-tech-contact"     = "psimon@kpmg.co.tz"
    "ke-app-end-of-life-date" = "2025-12-31"
  }

}

module "rg-Rich" {
  source   = "../../module/resource_group"
  name     = "KE-RG-CH-IDAS-LMS"
  location = "West Europe"
  tags = {
    "ke-app-name"             = "idaslms"
    "ke-app-cost-owner"       = "ssanghrajka@kpmg.co.ke"
    "ke-app-department"       = "IDAS"
    "ke-app-business-unit"    = "IDAS"
    "ke-app-budget"           = "$1000"
    "ke-app-environment"      = "Development"
    "ke-app-tech-contact"     = "jnjihia@kpmg.co.ke, richardmwangi@kpmg.co.ke"
    "ke-app-end-of-life-date" = "2025-12-31"
  }

}

module "func_app" {
  source                   = "../../module/function_app"
  resource_group_name      = "KE-RG-EUW-IDAS-LMS"
  location                 = "West Europe"
  storage_account_name     = "idastranslatorfiles"
  function_app_name        = "idastranslatorfunction"
  app_service_plan_name    = "plan-func-ke"
  os_type                  = "Linux"
  sku_name                 = "Y1"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
