data "template_file" "instance_startup_script" {
  template = file("web.sh.tpl")

  vars = {
    PROXY_PATH = "/home/praveensa/eTouch1/ilb/"
  }
}

module "instance_template1" {
  source             = "terraform-google-modules/vm/google//modules/instance_template"
  version            = "~> 1.1"
  project_id 	     = data.terraform_remote_state.application_project.outputs.project_id
  subnetwork 	     = data.terraform_remote_state.vpc_network.outputs.subnets_self_links_vpc_shared_host[0]
  region             = var.region
  subnetwork_project = data.terraform_remote_state.svpc-project-id.outputs.project_id
  startup_script     = data.template_file.instance_startup_script.rendered
  service_account  = {
     email = data.terraform_remote_state.service_account.outputs.email
     scopes = ["compute-ro","userinfo-email", "storage-ro"]
}
  tags               = ["allow-group1"]
}
module "mig1" {
  source             = "terraform-google-modules/vm/google//modules/mig"
  version            = "~> 1.1"
  project_id         = data.terraform_remote_state.application_project.outputs.project_id
  subnetwork_project = data.terraform_remote_state.svpc-project-id.outputs.project_id
  region             = var.region
  target_pools       = [module.gce-lb-fr.target_pool]
  instance_template  = module.instance_template1.self_link
  hostname           = "mig1"
  target_size        = 3
  named_ports        = local.named_ports
}
