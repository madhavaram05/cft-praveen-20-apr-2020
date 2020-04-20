#Module to create shared Folder
module "shared-services-folder" {
  source  = "terraform-google-modules/folders/google"
  version = "~>2.0.0"
  parent  = "organizations/${var.organization_id}"
  names   = ["${var.prefix}-shared-services"]
}
