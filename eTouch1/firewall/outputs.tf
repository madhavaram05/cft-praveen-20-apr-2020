output "target_tags" {
  description = "target-tag from the module"
  value       = module.net-firewall
}

output "firewall_name_rdp" {
  description = "custom firewall name created by the module"
  value       = module.net-firewall.custom_ingress_allow_rules
}
