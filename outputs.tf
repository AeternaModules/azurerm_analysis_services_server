output "analysis_services_servers" {
  description = "All analysis_services_server resources"
  value       = azurerm_analysis_services_server.analysis_services_servers
  sensitive   = true
}
output "analysis_services_servers_admin_users" {
  description = "List of admin_users values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.admin_users]
}
output "analysis_services_servers_backup_blob_container_uri" {
  description = "List of backup_blob_container_uri values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.backup_blob_container_uri]
  sensitive   = true
}
output "analysis_services_servers_ipv4_firewall_rule" {
  description = "List of ipv4_firewall_rule values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.ipv4_firewall_rule]
}
output "analysis_services_servers_location" {
  description = "List of location values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.location]
}
output "analysis_services_servers_name" {
  description = "List of name values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.name]
}
output "analysis_services_servers_power_bi_service_enabled" {
  description = "List of power_bi_service_enabled values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.power_bi_service_enabled]
}
output "analysis_services_servers_querypool_connection_mode" {
  description = "List of querypool_connection_mode values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.querypool_connection_mode]
}
output "analysis_services_servers_resource_group_name" {
  description = "List of resource_group_name values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.resource_group_name]
}
output "analysis_services_servers_server_full_name" {
  description = "List of server_full_name values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.server_full_name]
}
output "analysis_services_servers_sku" {
  description = "List of sku values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.sku]
}
output "analysis_services_servers_tags" {
  description = "List of tags values across all analysis_services_servers"
  value       = [for k, v in azurerm_analysis_services_server.analysis_services_servers : v.tags]
}

