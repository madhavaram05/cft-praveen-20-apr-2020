module "project-billingexport" {
  source                  = "terraform-google-modules/project-factory/google"
  version                 = "~> 3.3.0"
  random_project_id       = "false"
  name                    = "${var.prefix}-billingexport"
  project_id              = "${var.prefix}-billingexport"
  org_id                  = var.organization_id
  folder_id               = data.terraform_remote_state.folder_management.outputs.id_folder
  billing_account         = var.billing_account
  default_service_account = "keep"
  activate_apis           = var.activate_apis
}
