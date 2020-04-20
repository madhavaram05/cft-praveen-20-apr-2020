terraform {
backend "gcs" {
   prefix = "logsink/export"
  }
}
data "terraform_remote_state" "management_folder" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "folders/management"
 }
}
data "terraform_remote_state" "logs-sink-project" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/logsink"
 }
}

