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
    default = "function.zip"
}
variable "function_zip_source"   { 
    type = string
}
