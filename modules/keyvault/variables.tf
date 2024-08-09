variable "name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "location" {
  description = "Location of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID for the Key Vault"
  type        = string
}

variable "sku_name" {
  description = "SKU for the Key Vault"
  type        = string
}
