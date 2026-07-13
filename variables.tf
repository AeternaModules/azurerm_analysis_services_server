variable "analysis_services_servers" {
  description = <<EOT
Map of analysis_services_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - admin_users
    - backup_blob_container_uri
    - backup_blob_container_uri_key_vault_id (alternative to backup_blob_container_uri - read from Key Vault instead)
    - backup_blob_container_uri_key_vault_secret_name (alternative to backup_blob_container_uri - read from Key Vault instead)
    - power_bi_service_enabled
    - querypool_connection_mode
    - tags
    - ipv4_firewall_rule (block):
        - name (required)
        - range_end (required)
        - range_start (required)
EOT

  type = map(object({
    location                                        = string
    name                                            = string
    resource_group_name                             = string
    sku                                             = string
    admin_users                                     = optional(set(string))
    backup_blob_container_uri                       = optional(string)
    backup_blob_container_uri_key_vault_id          = optional(string)
    backup_blob_container_uri_key_vault_secret_name = optional(string)
    power_bi_service_enabled                        = optional(bool)
    querypool_connection_mode                       = optional(string)
    tags                                            = optional(map(string))
    ipv4_firewall_rule = optional(list(object({
      name        = string
      range_end   = string
      range_start = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.analysis_services_servers : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.analysis_services_servers : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.analysis_services_servers : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.analysis_services_servers : (
        contains(["D1", "B1", "B2", "S0", "S1", "S2", "S4", "S8", "S9", "S8v2", "S9v2"], v.sku)
      )
    ])
    error_message = "must be one of: D1, B1, B2, S0, S1, S2, S4, S8, S9, S8v2, S9v2"
  }
  validation {
    condition = alltrue([
      for k, v in var.analysis_services_servers : (
        v.backup_blob_container_uri == null || (length(v.backup_blob_container_uri) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.analysis_services_servers : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

