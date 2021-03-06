resource "google_filestore_instance" "instance" {
  project = data.terraform_remote_state.svpc-project-id.outputs.project_id
  name = "filestore-instance"
  zone = var.zone
  tier = "STANDARD"
    file_shares {
    capacity_gb = 1024
    name        = "nfs-share"
  }

  networks {
    network = data.terraform_remote_state.vpc_network.outputs.network_name
    modes   = ["MODE_IPV4"]
  }
}
