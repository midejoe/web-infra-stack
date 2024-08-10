variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure location for the resources"

}

variable "vnet_name" {
  description = "The Virtual network name"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
}

variable "web_subnet_address" {
  description = "Address space for the web tier subnet"
}

variable "db_subnet_address" {
  description = "Address space for the database tier subnet"
}

variable "appgw_subnet_address" {
  description = "Address space for the app gateway tier subnet"
}

variable "nsg_name" {
  description = "Name of security group"
}

variable "windows_image_publisher" {
  description = "Publisher of the windows virtual machine image"
  type        = string
}

variable "windows_image_offer" {
  description = "Offer of the windows virtual machine image"
  type        = string
}

variable "windows_image_sku" {
  description = "SKU (version) of the windows virtual machine image"
  type        = string
}

variable "windows_image_version" {
  description = "version of the windows virtual machine image"
  type        = string
}

variable "web_vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "db_vm_size" {
  description = "Size of the DB virtual machine"
  type        = string
}


variable "web_os_disk" {
  description = "Os disk size of the virtual machine for webapp"
  type        = number
}

variable "db_os_disk" {
  description = "Os disk size of the virtual machine for the database"
  type        = number
}

variable "avset_name" {
  description = "Name of the availability set"
  type        = string
}

variable "admin_username" {
  description = "Username for the virtual machine's administrator"
  type        = string
}

variable "admin_password" {
  description = "Password for the virtual machine's administrator"
  type        = string
}

variable "web_vm_count" {
  description = "Number of virtual machines to create"
  type        = number
}


##lb
variable "public_ip_name" {
  description = "The name of the public IP for the load balancer."
  type        = string
}

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
  type        = string
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool."
  type        = string
}

variable "probe_name" {
  description = "The name of the load balancer probe."
  type        = string
}

variable "rule_name" {
  description = "The name of the load balancer rule."
  type        = string
}

variable "web_nic_ids" {
  description = "A list of network interface IDs for the backend pool."
  type        = list(string)
  default     = []
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


variable "recovery_vault_name" {
  description = "The recovery vault name"
  type        = string
}

variable "backup_policy_name" {
  description = "The backup policy name"
  type        = string
}

variable "security-contact-email" {
  description = "The security contact email"
  type        = string
}

variable "security-contact-phone" {
  description = "The security contact phone"
  type        = string
}

variable "log-analytics-name" {
  description = "The log analytics name"
  type        = string
}


variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "user_assigned_identity_name" {
  description = "The name of the User Assigned Identity."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL Server."
  type        = string
}

variable "transparent_data_encryption_key_name" {
  description = "The name of the Transparent Data Encryption Key."
  type        = string
}