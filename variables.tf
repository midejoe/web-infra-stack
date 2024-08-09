variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "web-infrastructure-rg"
}

variable "location" {
  description = "Azure location for the resources"
  default     = "East US"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "web_subnet_address" {
  description = "Address space for the web tier subnet"
  default     = "10.0.1.0/24"
}

variable "db_subnet_address" {
  description = "Address space for the database tier subnet"
  default     = "10.0.2.0/24"
}

variable "appgw_subnet_address" {
  description = "Address space for the app gateway tier subnet"
  default     = "10.0.3.0/24"
}

variable "nsg_name" {
  description = "Name of security group"
  default     = "webnsg"
}

variable "windows_image_publisher" {
  description = "Publisher of the windows virtual machine image"
  type        = string
  default = "MicrosoftWindowsServer"
}

variable "windows_image_offer" {
  description = "Offer of the windows virtual machine image"
  type        = string
  default = "WindowsServer"
}

variable "windows_image_sku" {
  description = "SKU (version) of the windows virtual machine image"
  type        = string
  default = "2019-Datacenter"
}

variable "windows_image_version" {
  description = "version of the windows virtual machine image"
  type        = string
  default = "latest"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default = "Standard_D8s_v5"
}

variable "os_disk" {
  description = "Os disk size of the virtual machine"
  type        = number
  default = 256
}

variable "avset_name" {
  description = "Name of the availability set"
  type        = string
  default = "avsetui"
}

variable "admin_username" {
  description = "Username for the virtual machine's administrator"
  type        = string
  default = "adminuser"

}

variable "admin_password" {
  description = "Password for the virtual machine's administrator"
  type        = string
  default = "Adminpassword123@@@#####"
}

variable "web_vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default = 2
}


##lb
variable "public_ip_name" {
  description = "The name of the public IP for the load balancer."
  type        = string
  default     = "lb-public-ip"
}

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
  default     = "web-lb"
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
  type        = string
  default     = "web-lb-frontend"
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool."
  type        = string
  default     = "web-lb-backend"
}

variable "probe_name" {
  description = "The name of the load balancer probe."
  type        = string
  default     = "http-probe"
}

variable "rule_name" {
  description = "The name of the load balancer rule."
  type        = string
  default     = "http-rule"
}

variable "web_nic_ids" {
  description = "A list of network interface IDs for the backend pool."
  type        = list(string)
  default     = []
}

variable "sku_name" {
  description = "The SKU name of the Application Gateway."
  type        = string
  default     = "Standard_v2"
}

variable "tier" {
  description = "The tier of the Application Gateway SKU."
  type        = string
  default     = "Standard_v2"
}

variable "capacity" {
  description = "The capacity of the Application Gateway."
  type        = number
  default     = 2
}



variable "backend_http_port" {
  description = "The backend HTTP port for the Application Gateway."
  type        = number
  default     = 80
}

variable "frontend_port" {
  description = "The frontend port for the Application Gateway."
  type        = number
  default     = 80
}

variable "priority" {
  description = "The priority of the routing rule."
  type        = number
  default     = 1
}

variable "appgw-name" {
  description = "The app gateway name"
  type        = string
  default     = "zenpaygateway"
}