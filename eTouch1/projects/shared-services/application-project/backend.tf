terraform {
backend "gcs" {
    prefix = "projects/application"
  }
}
data "terraform_remote_state" "folder_shared-vpc" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "folders/shared-services"
  }
}
data "terraform_remote_state" "svpc_host_project" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/shared-vpc"
  }
}
