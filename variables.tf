
# ---------------------------------------------------------------
#  GKE VARIABLES
# ---------------------------------------------------------------

variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "gke_version" {
  default = "~> 6.0"
}

variable "cluster_name" {
  description = "Name of cluster"
  default     = "default"
}

variable "regional" {
  default = true
}

variable "region" {
  description = "The region to host the cluster in"
}

variable "node_zones" {
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = ["us-east1-b"]
}

variable network {
  description = "The VPC network to host the cluster in."
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
}

variable ip_range_pods {
  description = "The range name for pods"
}

variable ip_range_services {
  description = "The range name for services"
}

variable "monitoring_service" {
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "logging_service" {
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none"
  default     = "logging.googleapis.com/kubernetes"
}

variable "maintenance_start_time" {
  description = "Time window specified for daily maintenance operations in RFC3339 format"
  default     = "03:00"
}

variable "create_service_account" {
  default = "false"
}

variable "service_account_email" {

}


variable "skip_provisioners" {
  type        = bool
  description = "Flag to skip local-exec provisioners"
  default     = false
}

variable "http_load_balancing" {
  default = false
}

variable "horizontal_pod_autoscaling" {
  default = true
}

variable "network_policy" {
  default = true
}

variable "enable_private_nodes" {
  default = false
}

variable "master_ipv4_cidr_block" {
  default = "172.16.0.0/28"
}

variable "remove_default_node_pool" {
  default = false
}

# ----------------------------------------
#  NODE POOL VALUES
# ----------------------------------------

variable "core_pool_name" {
  default = "core-pool"
}

variable "core_pool_machine_type" {
  default = "n1-highmem-4"
}

variable "core_pool_min_count" {
  default = 1
}

variable "core_pool_max_count" {
  default = 3
}

variable "core_pool_local_ssd_count" {
  default = 0
}

variable "core_pool_disk_size_gb" {
  default = 100
}

variable "core_pool_disk_type" {
  default = "pd-standard"
}

variable "core_pool_image_type" {
  default = "COS"
}

variable "core_pool_auto_repair" {
  default = true
}

variable "core_pool_auto_upgrade" {
  default = true
}

variable "core_pool_preemptible" {
  default = false
}

variable "core_pool_initial_node_count" {
  default = 1
}

variable "core_pool_oauth_scope" {
  default = "https://www.googleapis.com/auth/cloud-platform"
}

# ----------------------------------------
#  USER POOL VALUES
# ----------------------------------------

variable "user_pool_name" {
  default = "user-pool"
}

variable "user_pool_machine_type" {
  default = "n1-highmem-8"
}

variable "user_pool_min_count" {
  default = 1
}

variable "user_pool_max_count" {
  default = 3
}

variable "user_pool_local_ssd_count" {
  default = 0
}

variable "user_pool_disk_size_gb" {
  default = 100
}

variable "user_pool_disk_type" {
  default = "pd-standard"
}

variable "user_pool_image_type" {
  default = "COS"
}

variable "user_pool_auto_repair" {
  default = true
}

variable "user_pool_auto_upgrade" {
  default = true
}

variable "user_pool_preemptible" {
  default = false
}

variable "user_pool_initial_node_count" {
  default = 1
}

variable "user_pool_oauth_scope" {
  default = "https://www.googleapis.com/auth/cloud-platform"
}
