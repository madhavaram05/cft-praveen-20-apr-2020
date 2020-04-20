
output "billing_export" {
  description = "Outputs from the log export module"
  value       = module.billing_export
}

#Output variables for billing export destination module
output "destination" {
  description = "Outputs from the destination module"
  value       = module.destination_billing_export
}
