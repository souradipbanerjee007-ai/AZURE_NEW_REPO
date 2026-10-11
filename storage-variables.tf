variable "storage_deployments" {
  type = map(object({
    rg_name                 = string
    storage_account_name    = string
    region_name             = string
    disable_public_access   = bool
    enable_private_endpoint = bool
    subnet_id               = optional(string, null)
  }))
  description = "Map of resource groups and storage accounts to deploy."

  validation {
    condition = alltrue([
      for k, v in var.storage_deployments :
      !v.enable_private_endpoint || (v.enable_private_endpoint && v.subnet_id != null)
    ])
    error_message = "If 'enable_private_endpoint' is true, a valid 'subnet_id' must be provided."
  }
}