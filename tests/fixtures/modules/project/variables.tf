# ---------------------------------------------------------------
#  PROJECT VARIABLES
# ---------------------------------------------------------------

variable credentials_path {
  description = "Location of the credential file."
}

variable org_id {
  description = "Organization id."
}

variable billing_account {
  description = "Billing account id."
}

variable project_name {
  description = "Name of the project."
}

variable random_project_id {
  description = "Enable random number to the end of the project."
  default     = true
}

variable auto_create_network {
  description = "Auto create default network."
  default     = true
}

variable activate_apis {
  description = "The list of apis to activate within the project	"
  default = [ 
    "compute.googleapis.com", 
    "container.googleapis.com", 
    "containerregistry.googleapis.com",
    "appengine.googleapis.com"
    ]
}

variable folder_id {
  description = "The ID of a folder to host this project"
}

variable default_service_account {
  description = "Project default service account setting: can be one of delete, depriviledge, or keep."
  default     = "delete"
}
variable disable_dependent_services {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  default     = "true"
}

variable labels {
  description = "Map of labels for project."
  default = {
    "environment" = "automation"
    "managed_by"  = "terraform"
  }
}