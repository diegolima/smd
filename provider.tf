provider "google-beta" {
  user_project_override = true
  version               = "~> 3.5"
}
provider "google" {
  version               = "~> 3.5"
}
terraform {
  backend "gcs" {
    bucket = var.function_bucket_name
    prefix = var.prefix
  }
}