output "user_assigned_identity_id" {
  description = "The ID of the User Assigned Identity."
  value       = azurerm_user_assigned_identity.example.id
}

output "key_vault_id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.example.id
}

output "key_vault_key_id" {
  description = "The ID of the Key Vault Key."
  value       = azurerm_key_vault_key.example.id
}

output "sql_server_id" {
  description = "The ID of the SQL Server."
  value       = azurerm_mssql_server.zenpaydatabase.id
}
