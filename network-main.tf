# 1. Resource Group
resource "azurerm_resource_group" "net_rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2. Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.net_rg.location
  resource_group_name = azurerm_resource_group.net_rg.name
  address_space       = var.vnet_address_space

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

# 3. Subnet for Private Endpoints
resource "azurerm_subnet" "pe_subnet" {
  name                 = "snet-private-endpoints"
  resource_group_name  = azurerm_resource_group.net_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]

  # Required/recommended when deploying Private Endpoints in modern azurerm:
  # "Disabled" allows Network Security Groups (NSGs) and User Defined Routes (UDRs) to apply.
  private_endpoint_network_policies = "Disabled"
}