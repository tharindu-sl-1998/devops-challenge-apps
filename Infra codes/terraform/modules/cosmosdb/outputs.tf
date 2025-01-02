output "cosmosdb_name" {
  description = "The name of the CosmosDB account"
  value       = azurerm_cosmosdb_account.main.name
}

output "cosmosdb_id" {
  description = "The ID of the CosmosDB account"
  value       = azurerm_cosmosdb_account.main.id
}

output "cosmosdb_endpoint" {
  description = "The endpoint of the CosmosDB account"
  value       = azurerm_cosmosdb_account.main.endpoint
}

output "primary_mongodb_connection_string" {
  description = "The primary MongoDB connection string"
  value       = azurerm_cosmosdb_account.main.primary_mongodb_connection_string
  sensitive   = true
}

output "cosmosdb_primary_key" {
  description = "The primary key for the CosmosDB account"
  value       = azurerm_cosmosdb_account.main.primary_key
  sensitive   = true
} 