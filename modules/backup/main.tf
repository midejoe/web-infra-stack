resource "azurerm_recovery_services_vault" "zenpay_recovery_vault" {
  name                = var.recovery_vault_name 
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}
resource "azurerm_backup_policy_vm" "vm_backup_policy" {
  name                =  var.backup_policy_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.zenpay_recovery_vault.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }
   }

resource "azurerm_security_center_contact" "security_contact" {
  email               = var.security-contact-email
  phone               = var.security-contact-phone 
  alert_notifications = true
  alerts_to_admins    = true
}


resource "azurerm_security_center_auto_provisioning" "auto_provisioning" {
  auto_provision = "On"
}


resource "azurerm_log_analytics_workspace" "securitypostlog" {
  name                = var.log-analytics-name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  }

resource "azurerm_security_center_workspace" "securityposturews" {
  scope                = var.rg_scope
  workspace_id         = azurerm_log_analytics_workspace.securitypostlog.id
}