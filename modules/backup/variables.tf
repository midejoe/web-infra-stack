variable "rg_scope" {
  description = "The Resource group id"
  type        = string
}

variable "recovery_vault_name" {
  description = "The name of the Recovery Services Vault."
  type        = string
}

variable "backup_policy_name" {
  description = "The name of the Backup Policy for VMs."
  type        = string
}

variable "security-contact-email" {
  description = "The email address for the security center contact."
  type        = string
}

variable "security-contact-phone" {
  description = "The phone number for the security center contact."
  type        = string
}

variable "log-analytics-name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "location" {
  description = "The location/region where resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which resources are created."
  type        = string
}
