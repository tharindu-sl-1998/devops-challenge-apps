resource "azurerm_cosmosdb_account" "main" {
  name                      = "wp-cosmos-main-001"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  offer_type               = "Standard"
  kind                     = "MongoDB"
  automatic_failover_enabled = true

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  tags = {
    project     = var.project
    environment = var.environment
    managed_by  = "terraform"
  }
} 