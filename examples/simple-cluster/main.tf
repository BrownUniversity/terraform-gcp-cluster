# ----------------------------------------------------------------------------
# TEST RESOURCES
# These resources are directly tested.
# ----------------------------------------------------------------------------
locals {
  gcp_region = "us-east1"
  gcp_zone = "us-east1-b"
}

# ------------------------------------------------------------
#   MAIN BLOCK
# ------------------------------------------------------------
# Create the GCP Project
module "project" {
  source                     = "git::https://github.com/BrownUniversity/terraform-gcp-project.git?ref=clean-up"

  project_name               = var.project_name
  org_id                     = var.org_id
  billing_account            = var.billing_account
  folder_id                  = var.folder_id
  activate_apis              = var.activate_apis
}

# Create VPC 
module "vpc" {
  source                     = "git::https://github.com/BrownUniversity/terraform-gcp-vpc.git?ref=master"
  credentials_path           = var.credentials_path
  project_id                 = module.project.project_id
  subnet_region              = local.gcp_region
}

module "simple-cluster" {
  source = "../../"

  regional                        = true
  region                          = local.gcp_region
  node_zones                      = [local.gcp_zone]
  maintenance_start_time          = "03:00"
  http_load_balancing             = false
  horizontal_pod_autoscaling      = true

  credentials_path = var.credentials_path
  project_id = module.project.project_id
  service_account_email = module.project.service_account_email

  core_pool_machine_type          = "e2-standard-2"
  core_pool_min_count             = 1
  core_pool_max_count             = 3
  core_pool_local_ssd_count       = 0
  core_pool_disk_size_gb          = 10
  core_pool_auto_repair           = true
  core_pool_auto_upgrade          = true
  core_pool_preemptible           = false
  core_pool_initial_node_count    = 1

  user_pool_machine_type          = "e2-standard-2"
  user_pool_min_count             = 0
  user_pool_max_count             = 3
  user_pool_local_ssd_count       = 0
  user_pool_disk_size_gb          = 10
  user_pool_auto_repair           = true
  user_pool_auto_upgrade          = true
  user_pool_preemptible           = false
  user_pool_initial_node_count    = 1
}