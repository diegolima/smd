resource "google_storage_bucket_object" "smd" {
  name   = "${var.function_zip_name}-${filemd5("${var.function_zip_name}.zip")}.zip"
  bucket = var.function_bucket_name
  source = "${var.function_zip_name}.zip"
}

resource "google_cloudfunctions_function" "smd" {
  name        = var.function_name
  project     = var.provider_project_name
  region      = var.provider_region
  runtime     = var.function_runtime

  available_memory_mb   = var.function_memory
  source_archive_bucket = var.function_bucket_name
  source_archive_object = google_storage_bucket_object.smd.name
  trigger_http          = true
  entry_point           = var.function_entrypoint

  depends_on = [ google_storage_bucket_object.smd ]
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.smd.project
  region         = google_cloudfunctions_function.smd.region
  cloud_function = google_cloudfunctions_function.smd.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

output "smd_cloudfunction_endpoint" {
    value = google_cloudfunctions_function.smd.https_trigger_url
}