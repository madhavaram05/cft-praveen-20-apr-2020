
variable "network" {
  description = "Name of the network to create resources in."
  type        = string
   default = "virtusa-shared-vpc"
 # default = "projects/virtusa-shared-vpc/global/networks/virtusa-shared-vpc"
  #default = "ps-shared-vpc"
}

variable "subnetwork" {
  description = "Name of the subnetwork to create resources in."
  type        = string
  default = "virtusa-prod-central"
 # default = "projects/virtusa-shared-vpc/regions/us-central1/subnetworks/virtusa-prod-central"
#  default = "prod-central"
  #default = "projects/praveen-sahukara/regions/us-central1/subnetworks/prod-central"
}

/*variable "service_account" {
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
  type = object({
    email  = string
    scopes = set(string)
  })

  default = {
     email = "virtusa-virtusa-vir-account@ps1-application.iam.gserviceaccount.com",
     scopes = ["compute-ro","userinfo-email", "storage-ro"]
}
}*/
/*variable "bucket" {
  description = "The bucket to store state files"
  type        = string
  default     = "virtusa1-project-demo-storage"
}*

/*variable "subnetwork_project" {
  description = "Name of the project for the subnetwork. Useful for shared VPC."
  type        = string
  default = "virtusa-shared-vpc"
 # default = "praveen-sahukara"
}

variable "project" {
  description = "The project id to deploy to"
  type        = string
  #default = "praveen-sahukara"
   default = "ps1-application"
}*/
