# output "lb_id" {
#   value = azurerm_lb.dev_zenpay_web_lb.id
# }

# output "lb_public_ip" {
#   value = azurerm_public_ip.lb.ip_address
# }

output "lb_public_ip_id" {
  description = "The ID of the public IP associated with the load balancer."
  value       = azurerm_public_ip.lb.id
}

output "lb_id" {
  description = "The ID of the load balancer."
  value       = azurerm_lb.dev_zenpay_web_lb.id
}

output "lb_backend_address_pool_id" {
  description = "The ID of the backend address pool of the load balancer."
  value       = azurerm_lb_backend_address_pool.web_lb_backend.id
}
