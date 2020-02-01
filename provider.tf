provider "google-beta" {
  user_project_override = true
  version               = "~> 3.5"
}
provider "google" {
  version               = "~> 3.5"
}
data "google_project" "smd" {
  project_id = var.provider_project_name
}