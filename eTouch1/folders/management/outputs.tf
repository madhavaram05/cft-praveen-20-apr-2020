output "id_folder" {
  description = "Folder id (for single use)."
  value       = module.management-folder.id
}

output "name_folder" {
  description = "Folder name (for single use)."
  value       = module.management-folder.name
}

output "folder_management" {
  description = "Folder resources."
  value       = module.management-folder
}

