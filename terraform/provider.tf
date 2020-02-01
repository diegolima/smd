provider "google-beta" {
  user_project_override = true
  version               = "~> 3.5"
}
provider "google" {
  version               = "~> 3.5"
}
terraform {
  backend "gcs" {
    bucket = "BUCKET"
    prefix = "tfstate/PREFIX"
  }
}