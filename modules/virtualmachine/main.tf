resource "azurerm_availability_set" "dev-zenpay-web" {
  name                = var.avset_name
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
  size                = var.web_vm_size 
  availability_set_id = azurerm_availability_set.dev-zenpay-web.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.web_os_disk 
  }

  source_image_reference {
    publisher = var.windows_image_publisher 
    offer     = var.windows_image_offer 
    sku       = var.windows_image_sku 
    version   = var.windows_image_version 
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
  size                = var.db_vm_size 
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.db_os_disk 
  }

  source_image_reference {
    publisher = var.windows_image_publisher
    offer     = var.windows_image_offer 
    sku       = var.windows_image_sku 
    version   = var.windows_image_version
  }
}
