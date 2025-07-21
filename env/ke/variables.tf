variable "storage_account_name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
    description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "account_tier" {
  default = "Standard"
}
variable "replication_type" {
  default = "LRS"
}
variable "kind" {
  default = "StorageV2"
}
variable "tags" {
  type    = map(string)
  default = {}
}
