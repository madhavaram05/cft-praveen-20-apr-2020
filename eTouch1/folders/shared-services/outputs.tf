output "id_folder" {
  description = "Folder id (for single use)."
  value       = module.shared-services-folder.id
}

output "name_folder" {
  description = "Folder name (for single use)."
  value       = module.shared-services-folder.name
}

output "folder_shared" {
  description = "Folder resources."
  value       = module.shared-services-folder
}
