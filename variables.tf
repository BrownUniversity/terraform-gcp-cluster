
# ---------------------------------------------------------------
#  GKE VARIABLES
# ---------------------------------------------------------------

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  default     = "latest"
}

variable "release_channel" {
  type        = string
  description = "The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `REGULAR`."
  default     = "REGULAR"
}

variable "cluster_name" {
  type        = string
  description = "Name of cluster"
  default     = "default"
}

variable "regional" {
  type        = bool
  description = "Whether the master node should be regional or zonal"
  default     = true
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
}

variable "node_zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = ["us-east1-b"]
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in."
  default     = "kubernetes-vpc"
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in"
  default     = "kubernetes-subnet"
}

variable "ip_range_pods" {
  type        = string
  description = "The range name for pods"
  default     = "kubernetes-pods"
}

variable "ip_range_services" {
  type        = string
  description = "The range name for services"
  default     = "kubernetes-services"
}

variable "monitoring_service" {
  type        = string
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "logging_service" {
  type        = string
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none"
  default     = "logging.googleapis.com/kubernetes"
}

variable "maintenance_start_time" {
  type        = string
  description = "Time window specified for daily maintenance operations in RFC3339 format"
  default     = "03:00"
}

variable "create_service_account" {
  type        = bool
  description = "Defines if service account specified to run nodes should be created."
  default     = false
}

variable "service_account_email" {
  type        = string
  description = "Email of service account"
}


variable "skip_provisioners" {
  type        = bool
  description = "Flag to skip local-exec provisioners"
  default     = false
}

variable "http_load_balancing" {
  type        = bool
  description = "Enable http load balancer add-on"
  default     = false
}

variable "horizontal_pod_autoscaling" {
  type        = bool
  description = "Enable horizontal pod autoscaling addon"
  default     = true
}

variable "network_policy" {
  type        = bool
  description = "Enable network policy addon"
  default     = true
}

variable "enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
  default     = true
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "(Beta) The IP range in CIDR notation to use for the hosted master network"
  default     = "172.16.0.0/28"
}

variable "remove_default_node_pool" {
  type        = bool
  description = "Remove default node pool while setting up the cluster"
  default     = false
}

# Enabling this makes standard_rwo storage class available, which resolves stadand volumes from not binding
# standard_rwo volumeBindingMode: Immediate to standard_rwo -> volumeBindingMode: WaitForFirstConsumer
# See more https://stackoverflow.com/questions/72553227/gke-can-t-scale-up-nodes-due-of-persistentvolume
variable "gce_pd_csi_driver" {
  type        = bool
  description = "(Beta) Whether this cluster should enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver."
  default     = true
}

# ----------------------------------------
#  NODE POOL VALUES
# ----------------------------------------

variable "core_pool_name" {
  type        = string
  description = "Name for the core-component pool"
  default     = "core-pool"
}

variable "core_pool_machine_type" {
  type        = string
  description = "Machine type for the core-component pool"
  default     = "n1-highmem-4"
}

variable "core_pool_min_count" {
  type        = number
  description = "Minimum number of nodes in the core-component pool"
  default     = 1
}

variable "core_pool_max_count" {
  type        = number
  description = "Maximum number of nodes in the core-component pool"
  default     = 3
}

variable "core_pool_local_ssd_count" {
  type        = number
  description = "Number of SSDs core-component pool"
  default     = 0
}

variable "core_pool_disk_size_gb" {
  type        = number
  description = "Size of disk for core-component pool"
  default     = 100
}


variable "core_pool_disk_type" {
  type        = string
  description = "Type of disk core-component pool"
  default     = "pd-standard"
}

variable "core_pool_image_type" {
  type        = string
  description = "Type of image core-component pool"
  default     = "COS_CONTAINERD"
}

variable "core_pool_auto_repair" {
  type        = bool
  description = "Enable auto-repair of core-component pool"
  default     = true
}

variable "core_pool_auto_upgrade" {
  type        = bool
  description = "Enable auto-upgrade of core-component pool"
  default     = true
}

variable "core_pool_preemptible" {
  type        = bool
  description = "Make core-component pool preemptible"
  default     = false
}

variable "core_pool_initial_node_count" {
  type        = number
  description = "Number of initial nodes in core-component pool"
  default     = 1
}

# ----------------------------------------
#  USER POOL VALUES
# ----------------------------------------

variable "user_pool_name" {
  type        = string
  description = "Name for the user pool"
  default     = "user-pool"
}

variable "user_pool_machine_type" {
  type        = string
  description = "Machine type for the user pool"
  default     = "n1-highmem-4"
}

variable "user_pool_min_count" {
  type        = number
  description = "Minimum number of nodes in the user pool"
  default     = 1
}

variable "user_pool_max_count" {
  type        = number
  description = "Maximum number of nodes in the user pool"
  default     = 20
}

variable "user_pool_local_ssd_count" {
  type        = number
  description = "Number of SSDs user pool"
  default     = 0
}

variable "user_pool_disk_size_gb" {
  type        = number
  description = "Size of disk for user pool"
  default     = 100
}

variable "user_pool_disk_type" {
  type        = string
  description = "Type of disk user pool"
  default     = "pd-standard"
}

variable "user_pool_image_type" {
  type        = string
  description = "Type of image user pool"
  default     = "COS_CONTAINERD"
}

variable "user_pool_auto_repair" {
  type        = bool
  description = "Enable auto-repair of user pool"
  default     = true
}

variable "user_pool_auto_upgrade" {
  type        = bool
  description = "Enable auto-upgrade of user pool"
  default     = true
}

variable "user_pool_preemptible" {
  type        = bool
  description = "Make user pool preemptible"
  default     = false
}

variable "user_pool_initial_node_count" {
  type        = number
  description = "Number of initial nodes in user pool"
  default     = 1
}

