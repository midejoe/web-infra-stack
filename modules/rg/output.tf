output "resource_group_name" {
  value = azurerm_resource_group.dev-zenpay-rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.dev-zenpay-rg.location
}

output "resource_group_id" {
  description = "The ID of the Resource Group"
  value       = azurerm_resource_group.dev-zenpay-rg.id
}

