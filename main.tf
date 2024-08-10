terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.86.0"
    }
  }
}

data "azurerm_client_config" "owner" {}

##resource group module####
module "resource_group" {
  source              = "./modules/resourcegroup"
  resource_group_name = var.resource_group_name
  location            = var.location
}

###virtual network module####
module "vnet" {
  source              = "./modules/virtualnetwork"
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  depends_on = [module.resource_group]
}

###subnet module####
module "subnet" {
  source               = "./modules/subnet"
  resource_group_name  = var.resource_group_name
  vnet_name            = var.vnet_name
  location             = var.location
  web_subnet_address   = var.web_subnet_address
  db_subnet_address    = var.db_subnet_address
  appgw_subnet_address = var.appgw_subnet_address

  depends_on = [module.vnet]
}

###nsg module####
module "nsg" {
  source              = "./modules/networksecuritygroup"
  location            = module.resource_group.resource_group_location
  nsg_name            = var.nsg_name
  resource_group_name = module.resource_group.resource_group_name
  web_subnet_address  = var.web_subnet_address
}

###vm module####
module "vm" {
  source                  = "./modules/virtualmachine"
  location                = module.resource_group.resource_group_location
  resource_group_name     = module.resource_group.resource_group_name
  web_subnet_id           = module.subnet.web_subnet_id
  db_subnet_id            = module.subnet.db_subnet_id
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  web_vm_count            = var.web_vm_count
  windows_image_publisher = var.windows_image_publisher
  windows_image_offer     = var.windows_image_offer
  windows_image_sku       = var.windows_image_sku
  windows_image_version   = var.windows_image_version
  web_vm_size             = var.web_vm_size
  db_vm_size              = var.db_vm_size
  web_os_disk             = var.web_os_disk
  db_os_disk              = var.db_os_disk
  avset_name              = var.avset_name

  depends_on = [module.subnet, module.nsg]
}

###loadbalancer module####
module "loadbalancer" {
  source                         = "./modules/loadbalancer"
  location                       = module.resource_group.resource_group_location
  resource_group_name            = module.resource_group.resource_group_name
  public_ip_name                 = var.public_ip_name
  lb_name                        = var.lb_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_name      = var.backend_address_pool_name
  probe_name                     = var.probe_name
  rule_name                      = var.rule_name
  web_nic_ids                    = var.web_nic_ids
}

###app gateway module####
module "appgateway" {
  source              = "./modules/applicationgateway"
  appgw-name          = var.appgw-name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  sku_name            = var.sku_name
  tier                = var.tier
  capacity            = var.capacity
  subnet_id           = module.subnet.appgw_subnet_id
  backend_http_port   = var.backend_http_port
  frontend_port       = var.frontend_port
  priority            = var.priority

  depends_on = [module.subnet]
}

###backup and security module####
module "backup_and_security" {
  source                 = "./modules/backup-security"
  location               = module.resource_group.resource_group_location
  resource_group_name    = module.resource_group.resource_group_name
  rg_scope               = module.resource_group.resource_group_id
  recovery_vault_name    = var.recovery_vault_name
  backup_policy_name     = var.backup_policy_name
  security-contact-email = var.security-contact-email
  security-contact-phone = var.security-contact-phone
  log-analytics-name     = var.log-analytics-name
}


module "sql" {
  source = "./modules/sql"

  location                             = var.location            #module.resource_group.resource_group_location
  resource_group_name                  = var.resource_group_name #module.resource_group.resource_group_name
  key_vault_name                       = var.key_vault_name
  user_assigned_identity_name          = var.user_assigned_identity_name
  sql_server_name                      = var.sql_server_name
  administrator_login                  = var.administrator_login
  administrator_login_password         = var.administrator_login_password
  transparent_data_encryption_key_name = var.transparent_data_encryption_key_name

  depends_on = [module.resource_group, module.nsg, module.backup_and_security, module.appgateway]
}