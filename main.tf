data "azurerm_key_vault_secret" "backup_blob_container_uri" {
  for_each     = { for k, v in var.analysis_services_servers : k => v if v.backup_blob_container_uri_key_vault_id != null && v.backup_blob_container_uri_key_vault_secret_name != null }
  name         = each.value.backup_blob_container_uri_key_vault_secret_name
  key_vault_id = each.value.backup_blob_container_uri_key_vault_id
}
resource "azurerm_analysis_services_server" "analysis_services_servers" {
  for_each = var.analysis_services_servers

  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  sku                       = each.value.sku
  admin_users               = each.value.admin_users
  backup_blob_container_uri = each.value.backup_blob_container_uri != null ? each.value.backup_blob_container_uri : try(data.azurerm_key_vault_secret.backup_blob_container_uri[each.key].value, null)
  power_bi_service_enabled  = each.value.power_bi_service_enabled
  querypool_connection_mode = each.value.querypool_connection_mode
  tags                      = each.value.tags

  dynamic "ipv4_firewall_rule" {
    for_each = each.value.ipv4_firewall_rule != null ? each.value.ipv4_firewall_rule : []
    content {
      name        = ipv4_firewall_rule.value.name
      range_end   = ipv4_firewall_rule.value.range_end
      range_start = ipv4_firewall_rule.value.range_start
    }
  }
}

