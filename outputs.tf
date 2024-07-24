# ---------------------------------------------------------------
#  GKE Outputs
# ---------------------------------------------------------------

output "region" {
  value = module.gke.region
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.name
}

output "location" {
  description = "The location (region or zone) in which the cluster master will be created"
  value       = module.gke.location
}

output "zones" {
  description = "List of zones in which the cluster resides"
  value       = module.gke.zones
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.gke.service_account
}

output "node_pools_names" {
  description = "List of node pools names"
  value       = module.gke.node_pools_names
}

output "http_load_balancing_enabled" {
  description = "Whether the cluster enables HTTP load balancing"
  value       = module.gke.http_load_balancing_enabled
}

output "horizontal_pod_autoscaling_enabled" {
  description = "Whether the cluster enables horizontal pod autoscaling"
  value       = module.gke.horizontal_pod_autoscaling_enabled
}
