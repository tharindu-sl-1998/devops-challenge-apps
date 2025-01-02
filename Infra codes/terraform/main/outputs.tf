output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.cluster_name
}

output "acr_login_server" {
  description = "The login server URL for the container registry"
  value       = module.acr.registry_login_server
}

output "cosmosdb_endpoint" {
  description = "The endpoint of the CosmosDB account"
  value       = module.cosmosdb.cosmosdb_endpoint
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = module.vm.vm_name
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = module.vm.private_ip_address
} 