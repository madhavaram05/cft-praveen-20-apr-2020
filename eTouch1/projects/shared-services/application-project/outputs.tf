output "project" {
  description = "The project module output"
  value       = module.application_project
}
output "project_name" {
  description = "The name of the project"
  value       = module.application_project.project_name
}

output "project_id" {
  description = "The ID of the project"
  value       = module.application_project.project_id
}
/*output "host-project" {
  description = "host project id ="
  value       = module.application_project.shared_vpc
}*/
