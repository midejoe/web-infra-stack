variable "avset_name" {
  description = "Name of the availability set"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}


variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}

variable "web_vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "db_vm_size" {
  description = "The size of the DB VM"
  type        = string
}

variable "web_vm_count" {
  description = "Number of web VMs"

}

variable "web_subnet_id" {
  description = "ID of the web subnet"
}

variable "db_subnet_id" {
  description = "ID of the database subnet"
}

variable "web_os_disk" {
  description = "The web OS disk size in GB"
  type        = string
}

variable "db_os_disk" {
  description = "The db OS disk size in GB"
  type        = string
}

variable "windows_image_publisher" {
  description = "The image publisher"
  type        = string
}

variable "windows_image_offer" {
  description = "The image offer"
  type        = string
}

variable "windows_image_sku" {
  description = "The image SKU"
  type        = string
}

variable "windows_image_version" {
  description = "The image version"
  type        = string
}