terraform {
  backend "gcs" {
    prefix = "firewall/state-files"
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
