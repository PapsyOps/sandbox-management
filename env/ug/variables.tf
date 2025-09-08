variable "resource_group_name" {
  type = string
}
variable "storage_account_name" {
  type = string
}
variable "location" {
  type    = string
  default = "West Europe"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "tags" {
  type = map(string)
}
