module "bucket" {
  source = "terraform-google-modules/cloud-storage/google"
  version = "~> 1.3"
  names = ["${var.prefix}-bucket"]
  project_id = data.terraform_remote_state.application_project.outputs.project_id
  prefix = var.prefix
  location   = "US"
}
