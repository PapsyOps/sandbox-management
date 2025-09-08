provider "azurerm" {
  features {}
}

variable "storage_account_name" {
  default = "keugprdsaveeambackup0001"
}

resource "azurerm_resource_group" "rg" {
  name     = "KE-RG-EUW-IDAS-Moodle"
  location = "westeurope"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
  large_file_share_enabled = true

  tags = {
    Charge_Code             = "MFKE03"
    ke-app-budget           = "1000"
    ke-app-business-unit    = "CSU"
    ke-app-cost-owner       = "jnyarumba@kpmg.co.ke"
    ke-app-department       = "ITS"
    ke-app-end-of-life-date = "1 year"
    ke-app-environment      = "production"
    ke-app-name             = "VEEAM"
    ke-app-tech-contact     = "mlutaaya@kpmg.com"
  }

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  blob_properties {
    versioning_enabled = true
  }

  file_properties {
    share_delete_retention_policy {
      enabled = false
      days    = 0
    }
  }
}

resource "azurerm_storage_container" "veeam_blob" {
  name                  = "veeamugdatabackup01"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"

  default_encryption_scope       = "account-encryption-key"
  deny_encryption_scope_override = false
}

# Optional: Add immutability policy for the container
resource "azurerm_storage_container_immutability_policy" "veeam_blob_policy" {
  storage_container_resource_manager_id = azurerm_storage_container.veeam_blob.resource_manager_id

  immutability_period_since_creation_in_days = 30
}
