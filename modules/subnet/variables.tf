variable "location" {
  description = "Location of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "web_subnet_address" {
  description = "Address space for the web tier subnet"
}

variable "db_subnet_address" {
  description = "Address space for the database tier subnet"
}

variable "appgw_subnet_address" {
  description = "Address space for the application gateway tier subnet"
}
