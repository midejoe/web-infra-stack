variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "location" {
  description = "Location of the network security group"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "web_subnet_address" {
  description = "Address space for the web tier subnet"
}


# variable "security_rules" {
#   description = "Security rules for the NSG"
#   type = list(object({
#     name                       = string
#     priority                   = number
#     direction                  = string
#     access                     = string
#     protocol                   = string
#     source_port_range          = string
#     destination_port_range     = string
#     source_address_prefix      = string
#     destination_address_prefix = string
#   }))
# }
