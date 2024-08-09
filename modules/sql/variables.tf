variable "resource_group_name" {
  description = "The name of the resource group in which resources are created."
  type        = string
}

variable "location" {
  description = "The location/region where resources will be deployed."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "user_assigned_identity_name" {
  description = "The name of the User Assigned Identity."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL Server."
  type        = string
}

variable "transparent_data_encryption_key_name" {
  description = "The name of the Key Vault key used for Transparent Data Encryption."
  type        = string
}
