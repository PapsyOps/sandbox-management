variable "existing_resource_group_name" {
  description = "Name of the Existing RG"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "existing_storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Function App"
  type        = string
}
variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}
variable "os_type" {
  description = "Name of the OS Type"
  type        = string
}

variable "sku_name" {
  description = "Name of the SKU name"
  type        = string
}
variable "account_tier" {
  description = "Name of the Account Tier"
  type        = string
}
variable "account_replication_type" {
  description = "Name of the Account replication type"
  type        = string
}
variable "tags" {
  type = map(string)
}