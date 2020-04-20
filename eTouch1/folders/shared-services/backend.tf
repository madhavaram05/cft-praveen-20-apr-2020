terraform {
  backend "gcs" {
    prefix = "folders/shared-services"
  }
}
