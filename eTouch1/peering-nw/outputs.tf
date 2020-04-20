output "network_name" {
  value       = module.vpc_peering.network_name
  description = "The name of the VPC being created"
}

output "network_self_link_vpc_peering" {
  value       = module.vpc_peering.network_self_link
  description = "The URI of the VPC being created"
}

output "svpc_host_project_id_vpc_peering" {
  value       = module.vpc_peering.svpc_host_project_id
  description = "Shared VPC host project id for prod"
}

output "subnets_self_links_vpc_peering" {
  value       = module.vpc_peering.subnets_self_links
  description = "The self-links of subnets being created"
}
output "subnets_names" {
  value       = module.vpc_peering.subnets_names
  description = "The names of the subnets being created"
}
