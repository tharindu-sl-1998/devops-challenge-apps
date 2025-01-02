output "registry_name" {
  description = "The name of the container registry"
  value       = azurerm_container_registry.main.name
}

output "registry_id" {
  description = "The ID of the container registry"
  value       = azurerm_container_registry.main.id
}

output "registry_login_server" {
  description = "The login server URL for the container registry"
  value       = azurerm_container_registry.main.login_server
}

output "admin_username" {
  description = "The admin username for the container registry"
  value       = azurerm_container_registry.main.admin_username
  sensitive   = true
}

output "admin_password" {
  description = "The admin password for the container registry"
  value       = azurerm_container_registry.main.admin_password
  sensitive   = true
} 