terraform {
  backend "gcs" {
    prefix = "peering-network"
  }
}
data "terraform_remote_state" "application_project" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/application"
  }
}
