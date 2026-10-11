output "storage_account_ids" {
  description = "IDs of the deployed storage accounts."
  value = {
    for k, v in azurerm_storage_account.sa : k => v.id
  }
}

output "storage_account_ids_list" {
  description = "List of storage account IDs"
  value       = [for sa in azurerm_storage_account.sa : sa.id]
}

output "private_endpoint_ips" {
  description = "Private IPs assigned to the private endpoints (if enabled)."
  value = {
    for k, v in azurerm_private_endpoint.pe : k => v.private_service_connection[0].private_ip_address
  }
}