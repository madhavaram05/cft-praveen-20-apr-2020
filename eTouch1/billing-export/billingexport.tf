
#module to create Billing Export Log Sink
module "billing_export" {
  source                 = "terraform-google-modules/log-export/google"
  version                = "~>3.1.1"
  destination_uri        = module.destination_billing_export.destination_uri
  log_sink_name          = "${var.prefix}_billing_export_log_sink"
  parent_resource_id     = var.billing_account
  parent_resource_type   = "billing_account"
  include_children       = "true"
  unique_writer_identity = "true"
}

#Module to create a destination dataset
module "destination_billing_export" {
  source                   = "terraform-google-modules/log-export/google//modules/bigquery"
  version                  = "~>3.1.1"
  project_id               = data.terraform_remote_state.project_billingexport.outputs.project_id
  dataset_name             = "${var.prefix}_billing_export"
  log_sink_writer_identity = module.billing_export.writer_identity
}
