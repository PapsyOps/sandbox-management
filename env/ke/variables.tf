
variable "existing_resource_group_name" {
  type = string
}
variable "location" {
  type    = string
  default = "West Europe"
}
variable "existing_storage_account_name" {
  type = string
}
variable "function_app_name" {
  type = string
}
variable "app_service_plan_name" {
  type = string
}
variable "sku_name" {
  type    = string
  default = "S1"
}
variable "os_type" {
  type    = string
  default = "Linux"
}
variable "account_tier" {
  type    = string
  default = "Standard"
}
variable "account_replication_type" {
  type    = string
  default = "LRS"
}
