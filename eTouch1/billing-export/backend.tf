terraform {
backend "gcs" {
    prefix = "billing/export"
  }
}
data "terraform_remote_state" "project_billingexport" {
  backend = "gcs"
  config = {
    bucket = var.bucket
    prefix = "projects/billingexport"
 }
}
