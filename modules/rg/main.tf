resource "azurerm_resource_group" "dev-zenpay-rg" {
  name     = var.resource_group_name
  location = var.location
}