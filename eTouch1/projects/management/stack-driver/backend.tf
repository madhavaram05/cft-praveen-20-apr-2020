terraform {
backend "gcs" {
    prefix = "projects/stackdriver"
  }
}
data "terraform_remote_state" "folder_management" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "folders/management"
 }
}
