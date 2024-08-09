resource "azurerm_public_ip" "appgw_pip" { 
    name = "appgw-pip" 
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = "Static" 
    sku = "Standard" 
    }


resource "azurerm_application_gateway" "zenpay-appgw" {
  name                = var.appgw-name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    tier     = var.tier
    capacity = var.capacity
  }

  gateway_ip_configuration {
    name      = "appgw-ip-configuration"
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = "appgw-frontend-ip"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  backend_address_pool {
    name = "appgw-backend-pool"
  }

  backend_http_settings {
    name                  = "appgw-backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = var.backend_http_port
    protocol              = "Http"
  }

  http_listener {
    name                           = "appgw-http-listener"
    frontend_ip_configuration_name = "appgw-frontend-ip"
    frontend_port_name             = "appgw-http-port"
    protocol                       = "Http"
  }

  frontend_port {
    name = "appgw-http-port"
    port = var.frontend_port
  }

  request_routing_rule {
    name                       = "appgw-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "appgw-http-listener"
    backend_address_pool_name  = "appgw-backend-pool"
    backend_http_settings_name = "appgw-backend-http-settings"
    priority                   = var.priority
  }
}
