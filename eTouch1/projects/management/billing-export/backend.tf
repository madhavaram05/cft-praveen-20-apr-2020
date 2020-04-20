terraform {
backend "gcs" { 
    prefix = "projects/billingexport"
  }
}
data "terraform_remote_state" "folder_management" {
  backend = "gcs"
  config = {
    bucket = var.bucket 
    prefix = "folders/management"
}
}
