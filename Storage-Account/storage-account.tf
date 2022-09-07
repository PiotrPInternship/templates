terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurestack_resource_group" "testrg" {
  name     = "resourceGroupName"
  location = "westeurope"
}

resource "azurestack_storage_account" "testsa" {
  name                     = "storageaccountname"
  resource_group_name      = azurestack_resource_group.testrg.name
  location                 = azurestack_resource_group.testrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}