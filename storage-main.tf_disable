# 1. Create the 3 Resource Groups
resource "azurerm_resource_group" "storage_rg" {
  for_each = var.storage_deployments

  name     = each.value.rg_name
  location = each.value.region_name
}

# 2. Create the Storage Account in each Resource Group
resource "azurerm_storage_account" "sa" {
  for_each = var.storage_deployments

  name                     = each.value.storage_account_name
  resource_group_name      = azurerm_resource_group.storage_rg[each.key].name
  location                 = azurerm_resource_group.storage_rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Toggle public network access based on disable_public_access flag
  public_network_access_enabled = !each.value.disable_public_access

  # Recommended security settings
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = {
    ManagedBy = "Terraform"
  }
}

# 3. Conditionally create Private Endpoints
# We filter the map to only include items where enable_private_endpoint is true
resource "azurerm_private_endpoint" "pe" {
  for_each = {
    for k, v in var.storage_deployments : k => v
    if v.enable_private_endpoint && v.subnet_id != null
  }

  name                = "pe-${each.value.storage_account_name}-blob"
  location            = azurerm_resource_group.storage_rg[each.key].location
  resource_group_name = azurerm_resource_group.storage_rg[each.key].name
  subnet_id           = each.value.subnet_id

  private_service_connection {
    name                           = "psc-${each.value.storage_account_name}-blob"
    private_connection_resource_id = azurerm_storage_account.sa[each.key].id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}