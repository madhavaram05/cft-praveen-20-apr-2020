output "vpc_shared_host" {
  value       = module.vpc_shared_host
  description = "Network resources"
}

output "network_name" {
  value       = module.vpc_shared_host.network_name
  description = "The name of the VPC being created"
}

output "network_self_link_vpc_shared_host" {
  value       = module.vpc_shared_host.network_self_link
  description = "The URI of the VPC being created"
}

output "svpc_host_project_id_vpc_shared_host" {
  value       = module.vpc_shared_host.svpc_host_project_id
  description = "Shared VPC host project id for prod"
}

output "subnets_self_links_vpc_shared_host" {
  value       = module.vpc_shared_host.subnets_self_links
  description = "The self-links of subnets being created"
}
output "subnets_names" {
  value       = module.vpc_shared_host.subnets_names
  description = "The names of the subnets being created"
} 
