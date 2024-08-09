# resource "azurerm_availability_set" "avset" {
#   name                = var.avset_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   platform_fault_domain_count = 2
#   platform_update_domain_count = 5
# }

# resource "azurerm_network_interface" "nic" {
#   count               = length(var.nics)
#   name                = "${var.nic_name_prefix}${count.index}"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                          = "ipconfig${count.index}"
#     subnet_id                     = var.nics[count.index].subnet_id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_virtual_machine" "vm" {
#   count               = length(var.vms)
#   name                = "${var.vm_name_prefix}${count.index}"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   network_interface_ids = [
#     element(azurerm_network_interface.nic.*.id, count.index)
#   ]
#   availability_set_id = azurerm_availability_set.avset.id
#   vm_size             = var.vm_size

#   storage_os_disk {
#     name              = "osdisk${count.index}"
#     caching           = "ReadWrite"
#     managed_disk_type = "Premium_LRS"
#     disk_size_gb      = var.disk_size
#     create_option     = "FromImage"
#   }

#   storage_image_reference {
#     publisher = var.publisher
#     offer     = var.offer
#     sku       = var.sku
#     version   = var.version
#   }

#   os_profile {
#     computer_name  = "hostname${count.index}"
#     admin_username = var.admin_username
#     admin_password = var.admin_password
#   }

#   os_profile_windows_config {}
# }


resource "azurerm_availability_set" "dev-zenpay-web" {
  name                = "web-avset"
  location            = var.location
  resource_group_name = var.resource_group_name
  managed             = true
}

resource "azurerm_network_interface" "web" {
  count               = var.web_vm_count
  name                = "web-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "web" {
  count               = var.web_vm_count
  name                = "web-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.web[count.index].id]
  size                = var.vm_size #"Standard_D2s_v3" 
  availability_set_id = azurerm_availability_set.dev-zenpay-web.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.os_disk
  }

  source_image_reference {
    publisher = var.windows_image_publisher #"MicrosoftWindowsServer"
    offer     = var.windows_image_offer #"WindowsServer"
    sku       = var.windows_image_sku #"2019-Datacenter"
    version   = var.windows_image_version #"latest"
  }
}

resource "azurerm_network_interface" "db" {
  name                = "db-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.db_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "db" {
  name                = "db-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.db.id]
  size                = var.vm_size #"Standard_D4s_v3"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.os_disk #256
  }

  source_image_reference {
    publisher = var.windows_image_publisher #"MicrosoftWindowsServer"
    offer     = var.windows_image_offer #"WindowsServer"
    sku       = var.windows_image_sku #"2019-Datacenter"
    version   = var.windows_image_version #"latest"
  }
}
