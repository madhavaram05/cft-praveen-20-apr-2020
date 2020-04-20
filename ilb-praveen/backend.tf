terraform {
  backend "gcs" {
    prefix = "ilb/statefiles"
  }
}
data "terraform_remote_state" "application_project" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/application"
  }
}
data "terraform_remote_state" "vpc_network" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "network/sharedvpc"
  }
}
data "terraform_remote_state" "svpc-project-id" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/shared-vpc"
  }
}
data "terraform_remote_state" "service_account" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "service-account/state-files"
  }
}
