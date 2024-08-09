

variable "location" {
  description = "The location/region where the Application Gateway will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Application Gateway is created."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Application Gateway."
  type        = string
  
}

variable "tier" {
  description = "The tier of the Application Gateway SKU."
  type        = string
  
}

variable "capacity" {
  description = "The capacity of the Application Gateway."
  type        = number
  default     = 2
}

variable "subnet_id" {
  description = "The ID of the subnet in which the Application Gateway is deployed."
  type        = string
}

variable "backend_http_port" {
  description = "The backend HTTP port for the Application Gateway."
  type        = number
  
}

variable "frontend_port" {
  description = "The frontend port for the Application Gateway."
  type        = number
  
}

variable "priority" {
  description = "The priority of the routing rule."
  type        = number
  
}

variable "appgw-name" {
  description = "The app gateway name"
  type        = string
  
}