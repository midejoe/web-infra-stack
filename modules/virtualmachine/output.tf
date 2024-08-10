output "web_vm_ids" {
  value = azurerm_windows_virtual_machine.web[*].id
}

output "db_vm_id" {
  value = azurerm_windows_virtual_machine.db.id
}

output "web_nic_ids" {
  value = azurerm_network_interface.web[*].id
}

output "db_nic_id" {
  value = azurerm_network_interface.db.id
}

