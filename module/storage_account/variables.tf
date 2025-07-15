variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "replication_type" {
  type = string
}

variable "kind" {
  type    = string
  default = "StorageV2"
}

variable "tags" {
  type = map(string)
}
