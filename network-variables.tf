variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "rg-network-demo"
}

variable "location" {
  type        = string
  description = "Azure region for the resources"
  default     = "eastus"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default     = "vnet-eastus"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "CIDR address space for the VNet"
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  type        = string
  description = "CIDR block for the private endpoint subnet"
  default     = "10.0.1.0/24"
}