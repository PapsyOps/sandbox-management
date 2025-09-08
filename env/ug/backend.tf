# Stores the state

terraform {
  backend "azurerm" {
    resource_group_name  = "KE-RG-SandboxManagement"
    storage_account_name = "tfstatestoragemanagement"
    container_name       = "tfstate"
    key                  = "ug/terraform.tfstate"
  }
}
