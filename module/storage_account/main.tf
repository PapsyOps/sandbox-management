resource "azurerm_storage_account" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  account_tier        = var.account_tier
  #kind                     = var.kind
  account_replication_type = var.replication_type

  blob_properties {
    versioning_enabled = true
  }

  tags = var.tags
}
