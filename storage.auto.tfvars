storage_deployments = {
  "deployment-01" = {
    rg_name                 = "rg-data-eastus-01"
    storage_account_name    = "sherlockstorage1"
    region_name             = "eastus"
    disable_public_access   = false
    enable_private_endpoint = false
    subnet_id               = null
   
  },
  "deployment-02" = {
    rg_name                 = "rg-logs-eastus2-02"
    storage_account_name    = "sherlockstorage2"
    region_name             = "eastus2"
    disable_public_access   = false
    enable_private_endpoint = false
    subnet_id               = null
  },
  "deployment-03" = {
    rg_name                 = "rg-shared-centralus-03"
    storage_account_name    = "sherlockstorage3"
    region_name             = "centralus"
    disable_public_access   = false
    enable_private_endpoint = false
    subnet_id               = null
  }
}