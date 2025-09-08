resource_group_name      = "UG-RG-Infra"
storage_account_name     = "ugstorageeast001"
location                 = "West Europe"
account_tier             = "Standard"
account_replication_type = "LRS"
tags = {
    "ke-app-name"             = "uginfra"
    "ke-app-cost-owner"       = "jnyarumba@kpmg.co.ke"
    "ke-app-department"       = "ITS"
    "ke-app-business-unit"    = "CSU"
    "ke-app-budget"           = "$1000"
    "ke-app-environment"      = "Development"
    "ke-app-tech-contact"     = "dampaire@kpmg.com"
    "ke-app-end-of-life-date" = "Never"
  
}


storage_account_name     = "ugstorageeast001"
resource_group_name      = "UG-RG-Infra"
location                 = "East Africa"
account_tier             = "Standard"
account_replication_type = "GRS"
tags = {
  "ke-app-backup"        = "Yes"

}
