
provider "google" {
  version = "~> 2.20"
}

module "gce-lb-fr" {
  source        = "GoogleCloudPlatform/lb/google"
  version       = "~> 2.0"
  region        = var.region
  network 	= data.terraform_remote_state.vpc_network.outputs.network_name
  project 	= data.terraform_remote_state.application_project.outputs.project_id
  firewall_project = data.terraform_remote_state.svpc-project-id.outputs.project_id
  name         = "virtusa-lb"
  service_port = local.named_ports[0].port
  target_tags  = ["allow-group1"]
}

module "gce-ilb" {
  source = "GoogleCloudPlatform/lb-internal/google"
  project 	= data.terraform_remote_state.application_project.outputs.project_id
  network_project = data.terraform_remote_state.svpc-project-id.outputs.project_id
  network 	= data.terraform_remote_state.vpc_network.outputs.network_name
  subnetwork 	= data.terraform_remote_state.vpc_network.outputs.subnets_names[0]
  region       = var.region
  name         = "virtusa-ilb"
  ports        = [local.named_ports[0].port]
  source_tags  = ["allow-group1"]
  target_tags  = ["allow-group2", "allow-group3"]
  health_check = local.health_check

  backends = [
    {
      group       = module.mig1.instance_group
      description = ""
    },
  ]
}
