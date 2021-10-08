terraform {
  backend "azurerm" {
    resource_group_name  = "devopstfstates"
    storage_account_name = "devopsmftamopstf"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

#Create Resource Group
resource "azurerm_resource_group" "devopsmf01" {
  name     = "devopsmf01"
  location = "eastus2"
}

#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "tamops-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.devopsmf01.name
}
