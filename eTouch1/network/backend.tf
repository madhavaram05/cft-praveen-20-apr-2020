terraform {
  backend "gcs" {
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
