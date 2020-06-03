# ------------------------------------------------------------
#   PROVIDER BLOCK
# ------------------------------------------------------------

provider "google-beta" {
  credentials = var.credentials_path
  version     = "~> 3.0"
}

provider "google" {
  credentials = var.credentials_path
  version     = "~> 3.0"
}

# ------------------------------------------------------------
#   SETUP GCP PROJECT
# ------------------------------------------------------------

# Create the GCP Project
module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 6.0"

  name                       = var.project_name
  random_project_id          = var.random_project_id
  org_id                     = var.org_id
  billing_account            = var.billing_account
  credentials_path           = var.credentials_path
  auto_create_network        = var.auto_create_network
  activate_apis              = var.activate_apis
  folder_id                  = var.folder_id
  default_service_account    = var.default_service_account
  disable_dependent_services = var.disable_dependent_services
  labels                     = "${var.labels}"
}

# Reservce a static IP address
resource "google_compute_address" "static" {
  name = "loadbalancer"
  project = "${module.project_factory.project_id}"
  region = "us-east1"
}