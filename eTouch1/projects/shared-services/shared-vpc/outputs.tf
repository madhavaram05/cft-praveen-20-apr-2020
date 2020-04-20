output "project" {
  description = "The project module output"
  value       = module.shared-vpc-project
}
output "project_name" {
  description = "The name of the project"
  value       = module.shared-vpc-project.project_name
}

output "project_id" {
  description = "The ID of the project"
  value       = module.shared-vpc-project.project_id
}

output "service_account_email" {
  description = "The email of the default service account"
  value       = module.shared-vpc-project.service_account_email
}
