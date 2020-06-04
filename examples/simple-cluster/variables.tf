variable "credentials_path" {}
variable "service_account_email" {}
variable "region" {}
variable org_id {}
variable billing_account {}
variable project_name {}
variable folder_id {}
variable activate_apis {
  description = "The list of apis to activate within the project"
  default = [ 
    "compute.googleapis.com", 
    "container.googleapis.com", 
    "containerregistry.googleapis.com",
    "appengine.googleapis.com"
    ]
}
