variable "function_bucket_name"  { type = string }
variable "function_memory"       {
    type    = string
    default = "128"
}
variable "function_name"         { type = string }
variable "function_entrypoint"   { type = string }
variable "function_runtime"      {
    type    = string
    default = "python37"
}
variable "function_zip_name"     {
    type    = string
    default = "function"
}
variable "provider_project_name" { type = string }
variable "provider_region"       { type = string }
variable "repository_app_dir"    {
    type = string
    default = "app"
}