terraform {
backend "gcs" { 
    prefix = "projects/shared-vpc"
  }
}
data "terraform_remote_state" "folder_shared_vpc" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "folders/shared-services"
  }
}
