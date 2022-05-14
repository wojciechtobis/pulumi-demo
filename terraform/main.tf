resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = "Central US"
}

resource "azurerm_storage_account" "sa" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  enable_https_traffic_only = false
}

resource "azurerm_storage_container" "test-container" {
  name                  = "test1"
  storage_account_name  = azurerm_storage_account.sa.name
}