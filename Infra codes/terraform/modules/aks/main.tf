resource "azurerm_kubernetes_cluster" "main" {
  name                = "wp-aks-main-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "wp-aks-main"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.0.10"
    service_cidr   = "10.0.0.0/16"
  }

  tags = {
    project     = var.project
    environment = var.environment
    managed_by  = "terraform"
  }
} 