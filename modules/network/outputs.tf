output "network_name" {
  value = azurerm_virtual_network.main.name
}

output "public_ip" {
  value = azurerm_public_ip.main.ip_address
}
