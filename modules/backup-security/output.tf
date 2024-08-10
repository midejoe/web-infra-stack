output "recovery_vault_id" {
  description = "The ID of the Recovery Services Vault."
  value       = azurerm_recovery_services_vault.zenpay_recovery_vault.id
}

output "backup_policy_id" {
  description = "The ID of the VM Backup Policy."
  value       = azurerm_backup_policy_vm.vm_backup_policy.id
}

output "security_contact_id" {
  description = "The ID of the Security Center Contact."
  value       = azurerm_security_center_contact.security_contact.id
}

output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.securitypostlog.id
}

output "security_center_workspace_id" {
  description = "The ID of the Security Center Workspace."
  value       = azurerm_security_center_workspace.securityposturews.id
}
