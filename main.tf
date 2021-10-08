terraform {
  backend "azurerm" {
    resource_group_name  = "tamopstfstates"
    storage_account_name = "tfstatedevops"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
}
 
provider "azurerm" {
  features {}
}
 
data "azurerm_client_config" "current" {}
 
#Create Resource Group
resource "azurerm_resource_group" "devopsforum" {
  name     = "devopsforum"
  location = "eastus2"
}
