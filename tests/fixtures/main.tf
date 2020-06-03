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
module "renku_project" {
  source                     = "./modules/project"

  credentials_path           = var.credentials_path
  project_name               = var.project_name
  random_project_id          = var.random_project_id
  org_id                     = var.org_id
  billing_account            = var.billing_account
  auto_create_network        = var.auto_create_network
  activate_apis              = var.activate_apis
  folder_id                  = var.folder_id
  default_service_account    = var.default_service_account
  disable_dependent_services = var.disable_dependent_services
  labels                     = "${var.labels}"
}

# Create VPC 
module "renku_vpc" {
  source                     = "./modules/vpc"
  credentials_path           = var.credentials_path

  project_id                 = module.renku_project.project_id
  network_name               = var.network_name
  routing_mode               = var.routing_mode
  subnet_name                = var.subnet_name
  subnet_ip                  = var.subnet_ip
  subnet_region              = local.gcp_region
  subnet_private_access      = var.subnet_private_access
  subnet_flow_logs           = var.subnet_flow_logs
  description                = var.description
  range_name_pods            = var.range_name_pods
  ip_range_pods              = var.ip_range_pods
  range_name_services        = var.range_name_services
  ip_range_services          = var.ip_range_services
  
}

module "sample-cluster" {
  source = "../../"

  regional                        = true
  region                          = local.gcp_region
  node_zones                      = [local.gcp_zone]
  maintenance_start_time          = "03:00"
  http_load_balancing             = false
  horizontal_pod_autoscaling      = true

  credentials_path = var.credentials_path
  project_id = module.renku_project.project_id
  cluster_name = var.cluster_name
  service_account_email = module.renku_project.service_account_email

  core_pool_machine_type          = "n1-highmem-4"
  core_pool_min_count             = 1
  core_pool_max_count             = 10
  core_pool_local_ssd_count       = 0
  core_pool_disk_size_gb          = 100
  core_pool_auto_repair           = true
  core_pool_auto_upgrade          = true
  core_pool_preemptible           = false
  core_pool_initial_node_count    = 3

  user_pool_machine_type          = "n1-highmem-8"
  user_pool_min_count             = 0
  user_pool_max_count             = 30
  user_pool_local_ssd_count       = 0
  user_pool_disk_size_gb          = 100
  user_pool_auto_repair           = true
  user_pool_auto_upgrade          = true
  user_pool_preemptible           = false
  user_pool_initial_node_count    = 1
}