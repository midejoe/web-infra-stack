resource_group_name = "web-infra-rg"
location            = "Central US"

#vnet values
vnet_name            = "main-vnet"
vnet_address_space   = ["10.0.0.0/16"]
web_subnet_address   = "10.0.1.0/24"
db_subnet_address    = "10.0.2.0/24"
appgw_subnet_address = "10.0.3.0/24"

#vm values
nsg_name                = "webnsg"
windows_image_publisher = "MicrosoftWindowsServer"
windows_image_offer     = "WindowsServer"
windows_image_sku       = "2019-Datacenter"
windows_image_version   = "latest"
web_vm_size             = "Standard_D2s_v3"
db_vm_size              = "Standard_D4s_v3"
web_os_disk             = 128
db_os_disk              = 256
avset_name              = "avsetui"
admin_username          = "adminuser"
admin_password          = "Adminpassword123@@@#####"
web_vm_count            = 2

#loadbalancer values
public_ip_name                 = "lb-public-ip"
lb_name                        = "web-lb"
frontend_ip_configuration_name = "web-lb-frontend"
backend_address_pool_name      = "web-lb-backend"
probe_name                     = "http-probe"
rule_name                      = "http-rule"
web_nic_ids                    = []
sku_name                       = "Standard_v2"
tier                           = "Standard_v2"
capacity                       = 2
backend_http_port              = 80
frontend_port                  = 80
priority                       = 1
appgw-name                     = "zenpaygateway"

##key vault, backup and security center values
recovery_vault_name    = "zenpayrecoveryvault"
backup_policy_name     = "vm-backup-policy"
security-contact-email = "midejoseph24@gmail.com"
security-contact-phone = "+2348122662392"
log-analytics-name     = "security-posture-log-analytics"

key_vault_name                       = "zenpaykeyweb46example"
user_assigned_identity_name          = "zenpaymanaagedid"
sql_server_name                      = "zenpaydata"
administrator_login                  = "adminuser"
administrator_login_password         = "ySafe11@@@567"
transparent_data_encryption_key_name = "nerwtbde"