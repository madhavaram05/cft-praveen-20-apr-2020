module "application_project" {
  source                  = "terraform-google-modules/project-factory/google"
  version                 = "~> 3.3.0"
  random_project_id       = "false"
  name                    = "${var.prefix}-application"
  project_id              = "${var.prefix}-application"
  org_id                  = var.organization_id
  folder_id               = data.terraform_remote_state.folder_shared-vpc.outputs.id_folder
  billing_account         = var.billing_account
  shared_vpc              = data.terraform_remote_state.svpc_host_project.outputs.project_id
  default_service_account = "keep"
  activate_apis           = var.activate_apis
}
