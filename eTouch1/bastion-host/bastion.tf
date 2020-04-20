provider "google" {
   #project_id  = data.terraform_remote_state.svpc-project-id.outputs.project_id  
   version      = "~> 2.7.0"
}

resource "google_compute_instance" "bastion" {
  project   = data.terraform_remote_state.svpc-project-id.outputs.project_id 
  name         = "${var.prefix}-bastion"
  machine_type = "n1-standard-1"
  zone         = var.zone
  tags         = [var.target_tag_ssh]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network    = data.terraform_remote_state.vpc_network.outputs.network_name
    #subnetwork = "projects/virtusa-shared-vpc/regions/us-central1/subnetworks/virtusa-prod-central"
    subnetwork = data.terraform_remote_state.vpc_network.outputs.subnets_self_links_vpc_shared_host[0]

    access_config {
      // Ephemeral IP
    }
  }

}

