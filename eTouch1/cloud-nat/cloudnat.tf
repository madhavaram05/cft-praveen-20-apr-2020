module "cloud-nat" {
  source        = "terraform-google-modules/cloud-nat/google"
  version       = "~> 1.2.0"
  name          = "${var.prefix}-nat-us-east1"
  project_id    = data.terraform_remote_state.svpc-project-id.outputs.project_id
  region        = var.region 
  network       = data.terraform_remote_state.vpc_network.outputs.network_name
  create_router = "true"
  router        = "${var.prefix}-router-us-east1"
}
