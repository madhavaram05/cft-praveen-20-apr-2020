provider "google" {
  version = "~> 3.3.0"
}

provider "google-beta" {
  version = "~> 3.3.0"
}

provider "null" {
  version = "~> 2.1"
}

module "peering-1" {
  source = "terraform-google-modules/network/google//modules/network-peering"
   local_network        = data.terraform_remote_state.vpc_network.outputs.network_self_link_vpc_shared_host
   peer_network        = data.terraform_remote_state.peer_network.outputs.network_self_link_vpc_peering
   export_local_custom_routes = true
}

