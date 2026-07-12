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
    - power_bi_service_enabled
    - querypool_connection_mode
    - tags
    - ipv4_firewall_rule (block):
        - name (required)
        - range_end (required)
        - range_start (required)
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    sku                       = string
    admin_users               = optional(set(string))
    backup_blob_container_uri = optional(string)
    power_bi_service_enabled  = optional(bool)
    querypool_connection_mode = optional(string) # Default: "All"
    tags                      = optional(map(string))
    ipv4_firewall_rule = optional(list(object({
      name        = string
      range_end   = string
      range_start = string
    })))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_analysis_services_server's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ServerName] !regexp.MustCompile(`^[a-z][0-9a-z]{2,62}$`).Match([]byte(value))
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: sku
  #   condition: contains(["D1", "B1", "B2", "S0", "S1", "S2", "S4", "S8", "S9", "S8v2", "S9v2"], value)
  #   message:   must be one of: D1, B1, B2, S0, S1, S2, S4, S8, S9, S8v2, S9v2
  # path: ipv4_firewall_rule.range_start
  #   source:    [from azValidate.IPv4Address] !ok
  # path: ipv4_firewall_rule.range_start
  #   source:    [from azValidate.IPv4Address] four == nil
  # path: ipv4_firewall_rule.range_end
  #   source:    [from azValidate.IPv4Address] !ok
  # path: ipv4_firewall_rule.range_end
  #   source:    [from azValidate.IPv4Address] four == nil
  # path: querypool_connection_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: backup_blob_container_uri
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

