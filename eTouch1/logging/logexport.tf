module "folder_log_export" {
  source                 = "terraform-google-modules/log-export/google"
  version                = "~>3.1.1"
  destination_uri        = module.destination_folder_log_export.destination_uri
  log_sink_name          = "${var.prefix}_logging_export_log_sink"
  parent_resource_id     = data.terraform_remote_state.management_folder.outputs.id_folder
  parent_resource_type   = "folder"
  include_children       = "true"
  unique_writer_identity = "true"
}

#Module to create log export destination
module "destination_folder_log_export" {
  source                   = "terraform-google-modules/log-export/google//modules/bigquery"
  version                  = "~>3.1.1"
  project_id               = data.terraform_remote_state.logs-sink-project.outputs.project_id
  dataset_name             = "${var.prefix}_logging_export"
  log_sink_writer_identity = module.folder_log_export.writer_identity
}

