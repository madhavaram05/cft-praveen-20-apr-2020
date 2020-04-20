module "vpc_shared_host" {
  source          = "terraform-google-modules/network/google"
  version         = "~> 1.2.0"
  #project_id     = "praveen-sahukara"
  project_id      = data.terraform_remote_state.svpc-project-id.outputs.project_id
  network_name    = "${var.prefix}-shared-vpc"
  #shared_vpc_host = "true"
  subnets = [
    {
      subnet_name           = "${var.prefix}-prod-central"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
    },
  ]
}
