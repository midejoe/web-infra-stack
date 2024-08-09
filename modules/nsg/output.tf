# output "nsg_id" {
#   value = azurerm_network_security_group.nsg.id
# }

output "web_nsg_id" {
  value = azurerm_network_security_group.dev_zenpay_web_nsg.id
}

output "db_nsg_id" {
  value = azurerm_network_security_group.dev_zenpay_db_nsg.id
}
