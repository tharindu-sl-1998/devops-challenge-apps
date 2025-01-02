terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "wp-rg-main-001"
  location = var.location

  tags = {
    project     = var.project
    environment = var.environment
    managed_by  = "terraform"
  }
}

# Call modules
module "aks" {
  source = "../modules/aks"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  project             = var.project
  environment         = var.environment
}

module "acr" {
  source = "../modules/acr"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  project             = var.project
  environment         = var.environment
}

module "cosmosdb" {
  source = "../modules/cosmosdb"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  project             = var.project
  environment         = var.environment
}

module "vm" {
  source = "../modules/vm"

  location             = var.location
  resource_group_name  = azurerm_resource_group.main.name
  project              = var.project
  environment          = var.environment
  admin_ssh_public_key = var.admin_ssh_public_key

  depends_on = [azurerm_resource_group.main]
} 