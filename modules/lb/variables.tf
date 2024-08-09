# variable "location" {
#   description = "Azure location for the resources"
# }

# variable "resource_group_name" {
#   description = "Name of the resource group"
# }

# variable "web_nic_ids" {
#   description = "IDs of the web tier NICs"
#   type        = list(string)
# }


variable "location" {
  description = "The location/region where the resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources are created."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP for the load balancer."
  type        = string
  # default     = "lb-public-ip"
}

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
  # default     = "web-lb"
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
  type        = string
  # default     = "web-lb-frontend"
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool."
  type        = string
  # default     = "web-lb-backend"
}

variable "probe_name" {
  description = "The name of the load balancer probe."
  type        = string
  # default     = "http-probe"
}

variable "rule_name" {
  description = "The name of the load balancer rule."
  type        = string
  # default     = "http-rule"
}

variable "web_nic_ids" {
  description = "A list of network interface IDs for the backend pool."
  type        = list(string)
  # default     = []
}
