module "vpc_peering" {
  source          = "terraform-google-modules/network/google"
  version         = "~> 1.2.0"
  project_id      = data.terraform_remote_state.application_project.outputs.project_id
  network_name    = "${var.prefix}-peering-vpc"
  #shared_vpc_host = "true"
  subnets = [
    {
      subnet_name           = "${var.prefix}-subnet"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
    },
  ]
}
