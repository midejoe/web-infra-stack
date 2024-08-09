resource "azurerm_subnet" "dev-zenpay-web" {
  name                 = "dev-web-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.web_subnet_address]
}

resource "azurerm_subnet" "dev-zenpay-db" {
  name                 = "dev-db-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.db_subnet_address]
}

resource "azurerm_subnet" "dev-zenpay-appgw" { 
  name = "dev-appgw-subnet" 
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.appgw_subnet_address]
  }