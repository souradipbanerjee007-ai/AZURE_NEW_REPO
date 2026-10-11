output "vnet_id" {
  description = "Resource ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "pe_subnet_id" {
  description = "Resource ID of the private endpoints subnet (use this in storage/private endpoint modules)"
  value       = azurerm_subnet.pe_subnet.id
}