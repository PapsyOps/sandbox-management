# Resource group name
variable "resource_group_name" {
  description = "Name of the Resource Group to create"
  type        = string
  default     = "KE-RG-EUW-IDAS-Moodle"
}

# Azure location
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "westeurope"
}

# Storage account name (must be globally unique, 3-24 lowercase letters and numbers)
variable "storage_account_name" {
  description = "Globally unique name for the Storage Account"
  type        = string
  default     = "keugprdsaveeambackup0001"
}

# Storage replication type
variable "storage_replication_type" {
  description = "Replication type for the Storage Account (LRS, GRS, RAGRS, ZRS)"
  type        = string
  default     = "GRS"
}

# Storage account tier
variable "storage_account_tier" {
  description = "Storage Account performance tier"
  type        = string
  default     = "Standard"
}

# Tags (map for flexibility)
variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default = {
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
}
