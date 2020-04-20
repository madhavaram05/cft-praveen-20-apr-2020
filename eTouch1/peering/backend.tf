terraform {
backend "gcs" {
    prefix = "peering-nw"
  }
}
data "terraform_remote_state" "application_project" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/application"
  }
}
data "terraform_remote_state" "svpc-project-id" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/shared-vpc"
  }
}
data "terraform_remote_state" "vpc_network" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "network/sharedvpc"
  }
}
data "terraform_remote_state" "peer_network" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "peering-network"
  }
}

