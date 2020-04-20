#Module to create management Folder
module "management-folder" {
  source  = "terraform-google-modules/folders/google"
  version = "~>2.0.0"
  parent  = "organizations/${var.organization_id}"
  names   = ["${var.prefix}-management"]
}

