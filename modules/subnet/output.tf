output "web_subnet_id" {
  description = "The ID of the web subnet."
  value       = azurerm_subnet.dev-zenpay-web.id
}

output "db_subnet_id" {
  description = "The ID of the database subnet."
  value       = azurerm_subnet.dev-zenpay-db.id
}

output "appgw_subnet_id" {
  description = "The ID of the application gateway subnet."
  value       = azurerm_subnet.dev-zenpay-appgw.id
}
