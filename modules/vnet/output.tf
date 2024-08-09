
output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.dev-zenpay-vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.dev-zenpay-vnet.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network."
  value       = azurerm_virtual_network.dev-zenpay-vnet.address_space
}
