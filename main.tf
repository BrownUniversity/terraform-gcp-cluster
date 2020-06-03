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
#   CREATE REGIONAL CLUSTER
# ------------------------------------------------------------


# Create the GKE Cluster
module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  project_id                 = var.project_id
  name                       = var.cluster_name
  regional                   = var.regional
  region                     = var.region
  zones                      = var.node_zones
  network                    = var.network_name
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.range_name_pods
  ip_range_services          = var.range_name_services
  logging_service            = var.logging_service
  monitoring_service         = var.monitoring_service
  maintenance_start_time     = var.maintenance_start_time
  create_service_account     = var.create_service_account
  service_account            = var.service_account_email
  skip_provisioners          = var.skip_provisioners
  http_load_balancing        = var.http_load_balancing
  horizontal_pod_autoscaling = var.horizontal_pod_autoscaling
  network_policy             = var.network_policy
  enable_private_nodes       = var.enable_private_nodes
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  remove_default_node_pool   = var.remove_default_node_pool

  node_pools = [
    {
      name               = var.core_pool_name
      machine_type       = var.core_pool_machine_type
      min_count          = var.core_pool_min_count
      max_count          = var.core_pool_max_count
      local_ssd_count    = var.core_pool_local_ssd_count
      disk_size_gb       = var.core_pool_disk_size_gb
      disk_type          = var.core_pool_disk_type
      image_type         = var.core_pool_image_type
      auto_repair        = var.core_pool_auto_repair
      auto_upgrade       = var.core_pool_auto_upgrade
      service_account    = var.service_account_email
      preemptible        = var.core_pool_preemptible
      initial_node_count = var.core_pool_initial_node_count
    },
    {
      name               = var.user_pool_name
      machine_type       = var.user_pool_machine_type
      min_count          = var.user_pool_min_count
      max_count          = var.user_pool_max_count
      local_ssd_count    = var.user_pool_local_ssd_count
      disk_size_gb       = var.user_pool_disk_size_gb
      disk_type          = var.user_pool_disk_type
      image_type         = var.user_pool_image_type
      auto_repair        = var.user_pool_auto_repair
      auto_upgrade       = var.user_pool_auto_upgrade
      service_account    = var.service_account_email
      preemptible        = var.user_pool_preemptible
      initial_node_count = var.user_pool_initial_node_count
    }
  ]

  //labels on the kubernetes API node object and can be used in nodeSelectors
  node_pools_labels = {
    # all = {}

    core-pool = {   
        "hub.jupyter.org/node-purpose" = "core"
    }
    

    user-pool = {
        "hub.jupyter.org/node-purpose" = "user"
    }
    
  }


  //kubernetes taints on all nodes in the new node-pool, which can be used with tolerations for pod scheduling
  node_pools_taints = {
    # all = []

    user-pool = [
      {
        key    = "hub.jupyter.org/dedicated"
        value  = "user"
        effect = "NO_SCHEDULE"
      }
    ]
  }

}

# ------------------------------------------------------------
#  CONNECT KUBECTL
# ------------------------------------------------------------

resource "null_resource" "cluster_credentials" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${module.gke.name} --region ${module.gke.location} --project ${var.project_id}"
  }

  depends_on = [module.gke]
}

data "google_client_config" "default" {}

