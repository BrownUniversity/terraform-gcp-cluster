# ----------------------------------------------------------------------------
# TEST RESOURCES
# These resources are directly tested.
# ----------------------------------------------------------------------------
locals {
  gcp_region     = "us-east1"
  gcp_zone       = "us-east1-b"
  project_name   = "inspec-cluster-test1"
  network_prefix = "cft-gke-test"
  regional       = false
}

# ------------------------------------------------------------
#   MAIN BLOCK
# ------------------------------------------------------------
# Create the GCP Project
module "project" {
  source          = "git@github.com:BrownUniversity/terraform-gcp-project.git"
  project_name    = local.project_name
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = var.folder_id
  activate_apis   = var.activate_apis
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "google_compute_network" "main" {
  project                 = module.project.project_id
  name                    = "${local.network_prefix}-${random_string.suffix.result}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main" {
  project       = module.project.project_id
  name          = "${local.network_prefix}-${random_string.suffix.result}"
  ip_cidr_range = "10.0.0.0/17"
  region        = local.gcp_region
  network       = google_compute_network.main.self_link

  secondary_ip_range {
    range_name    = "${local.network_prefix}-pods-${random_string.suffix.result}"
    ip_cidr_range = "192.168.0.0/18"
  }

  secondary_ip_range {
    range_name    = "${local.network_prefix}-services-${random_string.suffix.result}"
    ip_cidr_range = "192.168.64.0/18"
  }
}


module "simple_cluster" {
  source = "../../"

  network           = google_compute_network.main.name
  subnetwork        = google_compute_subnetwork.main.name
  ip_range_pods     = google_compute_subnetwork.main.secondary_ip_range[0].range_name
  ip_range_services = google_compute_subnetwork.main.secondary_ip_range[1].range_name

  regional                   = local.regional
  region                     = local.gcp_region
  node_zones                 = [local.gcp_zone]
  maintenance_start_time     = "03:00"
  http_load_balancing        = false
  horizontal_pod_autoscaling = true

  project_id            = module.project.project_id
  service_account_email = module.project.service_account_email

  core_pool_machine_type       = "n1-standard-1"
  core_pool_min_count          = 1
  core_pool_max_count          = 3
  core_pool_local_ssd_count    = 0
  core_pool_disk_size_gb       = 10
  core_pool_auto_repair        = true
  core_pool_auto_upgrade       = true
  core_pool_preemptible        = false
  core_pool_initial_node_count = 1

  user_pool_machine_type       = "n1-standard-1"
  user_pool_min_count          = 0
  user_pool_max_count          = 3
  user_pool_local_ssd_count    = 0
  user_pool_disk_size_gb       = 10
  user_pool_auto_repair        = true
  user_pool_auto_upgrade       = true
  user_pool_preemptible        = false
  user_pool_initial_node_count = 1
}
