terraform {
 backend "gcs" {
    prefix = "service-account/state-files"
  }
}
data "terraform_remote_state" "application_project" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/application"
  }
}
