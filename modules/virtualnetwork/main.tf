resource "azurerm_virtual_network" "dev-zenpay-vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}




# resource "azurerm_virtual_network" "zenpayvnet" {
#   name                = "zenpayvnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.zenpayrg.location
#   resource_group_name = azurerm_resource_group.zenpayrg.name
#   }
  
#   resource "azurerm_subnet" "web" {
#   name                 = "web-subnet"
#   resource_group_name  = azurerm_resource_group.zenpayrg.name
#   virtual_network_name = azurerm_virtual_network.zenpayvnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_subnet" "db" {
#   name                 = "db-subnet"
#   resource_group_name  = azurerm_resource_group.zenpayrg.name
#   virtual_network_name = azurerm_virtual_network.zenpayvnet.name
#   address_prefixes     = ["10.0.2.0/24"] 
#   }
# resource "azurerm_subnet" "appgw" { 
#   name = "appgw-subnet" 
#   resource_group_name = azurerm_resource_group.zenpayrg.name 
#   virtual_network_name = azurerm_virtual_network.zenpayvnet.name 
#   address_prefixes = ["10.0.3.0/24"] 
#   }


# resource "azurerm_subnet" "subnet" {
#   count               = length(var.subnets)
#   name                = var.subnets[count.index].name
#   resource_group_name = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes    = [var.subnets[count.index].address_prefix]
# }