data "azurerm_storage_account" "existing" {
  name                = var.existing_storage_account_name
  resource_group_name = var.existing_resource_group_name
}

output "storage_account_key" {
  value     = data.azurerm_storage_account.existing.primary_access_key
  sensitive = true
}

resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  os_type             = var.os_type
  location            = var.location
  resource_group_name = var.existing_resource_group_name
  sku_name            = var.sku_name
}

resource "azurerm_linux_function_app" "fa" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.existing_resource_group_name
  service_plan_id            = azurerm_service_plan.plan.id
  storage_account_name       = data.azurerm_storage_account.existing.name
  storage_account_access_key = data.azurerm_storage_account.existing.primary_access_key


  site_config {
    application_stack {
      python_version = "3.10"
    }
  }
}
