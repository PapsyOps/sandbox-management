resource_group_name      = "KE-RG-EUW-IDAS-Moodle"
location                 = "westeurope"
storage_account_name     = "keugprdsaveeambackup0001"
storage_replication_type = "GRS"
storage_account_tier     = "Standard"

tags = {
  Charge_Code             = "MFKE03"
  ke-app-budget           = "2000"
  ke-app-business-unit    = "CSU"
  ke-app-cost-owner       = "finance@kpmg.co.ke"
  ke-app-department       = "ITS"
  ke-app-end-of-life-date = "2 years"
  ke-app-environment      = "production"
  ke-app-name             = "VEEAM"
  ke-app-tech-contact     = "mlutaaya@kpmg.com"
}
