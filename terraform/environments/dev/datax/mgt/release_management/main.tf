locals {
  tags = merge(var.tags, var.common_tags, {
    AppName    = "Release Management"
    AppOwner   = "DataX"
    Subsidiary = var.subsidiary
    Service    = var.service_name
    Project    = var.project_name
  })
  key_vault_key_name = "storage-encryption"
}

data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "app_rg" {
  name = var.rg_name
}

module "key_vault" {
  source = "../../../../../modules/security/key-vault"

  location = var.location

  kv_crypto_officer_pid = data.azurerm_client_config.current.object_id
  logs_destinations_ids = []

  environment         = var.environment
  project_name        = var.project_name
  service_name        = var.service_name
  subsidiary          = var.subsidiary
  resource_group_name = data.azurerm_resource_group.app_rg.name
  other_suffix        = "01"

  key_vault_keys = {
    "keys" = {
      name     = local.key_vault_key_name
      key_type = "RSA"
      key_size = 2048
      key_opts = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
    }
  }

  enabled_for_deployment          = false
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = false
  network_acls = {
    bypass                     = "AzureServices"
    default_action             = "Allow"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
  rbac_authorization_enabled    = true
  public_network_access_enabled = true

  tags = local.tags
}

# Storage Configure
module "storage" {
  source                  = "../../../../../modules/storage/storage-account"
  resource_group_name     = data.azurerm_resource_group.app_rg.name
  resource_group_location = data.azurerm_resource_group.app_rg.location
  tags                    = local.tags
  environment             = var.environment
  subsidiary              = var.subsidiary
  service_name            = var.service_name
  project_name            = var.project_name
  other_suffix            = var.storage_suffix

  account_kind                  = "StorageV2"
  skuname                       = "Standard_LRS"
  public_access_enabled         = "Allow"
  public_network_access_enabled = true

  containers_list = [{
    name        = "release-management"
    access_type = "private"
  }]

  delete_retention_policy = {
    days = 7
  }

  key_vault_id              = module.key_vault.key_vault_id
  key_vault_key_resource_id = module.key_vault.key_vault_id
  key_vault_key_name        = local.key_vault_key_name

  depends_on = [module.key_vault]
}
