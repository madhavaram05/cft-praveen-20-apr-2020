variable "organization_id" {
  description = "The organization ID"
  type        = string
  default     = "427157672871"
}
variable "billing_account" {
  description = "The ID of the billing account to associate the projects with"
  type        = string
  default     = "009581-D891BC-5D3CB6"
}
variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = ["compute.googleapis.com"]
}
variable "bucket" {
  description = "The bucket to store state files"
  type        = string
  default     = "virtusa4-project-demo-storage"
}
variable "prefix" {
  description = "The prefix used for projects and dataset ID/names"
  type        = string
  default     = "filestore1"
}
variable "target_tag_ssh" {
  description = "The target tag firewall used by bastion host"
  type        = string
  default     = "ssh"
}
variable "region" {
  description = "Region for cloud resources."
  type        = string
  default = "us-central1"
}
variable "zone" {
  type = string 
  default = "us-central1-a"
}
