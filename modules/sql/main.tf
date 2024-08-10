data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "zenpay_identity" {
  name                = var.user_assigned_identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault" "zenpay_key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = azurerm_user_assigned_identity.zenpay_identity.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Update",
      "Recover",
      "Purge",
      "GetRotationPolicy"
    ]
  }

  access_policy {
    tenant_id = azurerm_user_assigned_identity.zenpay_identity.tenant_id
    object_id = azurerm_user_assigned_identity.zenpay_identity.principal_id
    key_permissions = ["Get", "WrapKey", "UnwrapKey"]
  }
}

resource "azurerm_key_vault_key" "zenpay_key_vault_key" {
  depends_on = [azurerm_key_vault.zenpay_key_vault]
  name       = var.transparent_data_encryption_key_name
  key_vault_id = azurerm_key_vault.zenpay_key_vault.id
  key_type   = "RSA"
  key_size   = 2048
  key_opts   = ["unwrapKey", "wrapKey"]
}

resource "azurerm_mssql_server" "zenpaydatabase" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.zenpay_identity.name
    object_id      = azurerm_user_assigned_identity.zenpay_identity.principal_id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.zenpay_identity.id]
  }

  primary_user_assigned_identity_id            = azurerm_user_assigned_identity.zenpay_identity.id
  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.zenpay_key_vault_key.id
}