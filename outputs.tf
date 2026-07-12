output "analysis_services_servers_id" {
  description = "Map of id values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.id }
}
output "analysis_services_servers_admin_users" {
  description = "Map of admin_users values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.admin_users }
}
output "analysis_services_servers_backup_blob_container_uri" {
  description = "Map of backup_blob_container_uri values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.backup_blob_container_uri }
  sensitive   = true
}
output "analysis_services_servers_ipv4_firewall_rule" {
  description = "Map of ipv4_firewall_rule values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.ipv4_firewall_rule }
}
output "analysis_services_servers_location" {
  description = "Map of location values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.location }
}
output "analysis_services_servers_name" {
  description = "Map of name values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.name }
}
output "analysis_services_servers_power_bi_service_enabled" {
  description = "Map of power_bi_service_enabled values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.power_bi_service_enabled }
}
output "analysis_services_servers_querypool_connection_mode" {
  description = "Map of querypool_connection_mode values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.querypool_connection_mode }
}
output "analysis_services_servers_resource_group_name" {
  description = "Map of resource_group_name values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.resource_group_name }
}
output "analysis_services_servers_server_full_name" {
  description = "Map of server_full_name values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.server_full_name }
}
output "analysis_services_servers_sku" {
  description = "Map of sku values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.sku }
}
output "analysis_services_servers_tags" {
  description = "Map of tags values across all analysis_services_servers, keyed the same as var.analysis_services_servers"
  value       = { for k, v in azurerm_analysis_services_server.analysis_services_servers : k => v.tags }
}

