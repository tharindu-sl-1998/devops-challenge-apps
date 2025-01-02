resource "azurerm_container_registry" "main" {
  name                = "wpacrmain001"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                = "Standard"
  admin_enabled      = true

  tags = {
    project     = var.project
    environment = var.environment
    managed_by  = "terraform"
  }
} 