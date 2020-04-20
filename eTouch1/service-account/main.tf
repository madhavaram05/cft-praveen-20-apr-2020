module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = data.terraform_remote_state.application_project.outputs.project_id
  prefix        = var.prefix
  names         = var.name
  #project_roles = ["${var.project_id}=>roles/viewer"]
  project_roles = ["${data.terraform_remote_state.application_project.outputs.project_id}=>roles/owner"]
}
