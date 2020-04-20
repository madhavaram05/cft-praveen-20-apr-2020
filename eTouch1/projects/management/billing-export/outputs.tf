output "project" {
  description = "The project module output"
  value       = module.project-billingexport
}
output "project_name" {
  description = "The name of the project"
  value       = module.project-billingexport.project_name
}

output "project_id" {
  description = "The ID of the project"
  value       = module.project-billingexport.project_id
}

output "service_account_email" {
  description = "The email of the default service account"
  value       = module.project-billingexport.service_account_email
}

