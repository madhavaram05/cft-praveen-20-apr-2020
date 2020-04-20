output "bastion_hostname" {
  description = "Host name of the bastion"
  value       = google_compute_instance.bastion.name
}

output "target_tag" {
  description = "Target tag firewall for the bastion host"
  value       = google_compute_instance.bastion.tags
}
