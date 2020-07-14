# ---------------------------------------------------------------
#  GKE Outputs
# ---------------------------------------------------------------

output "region" {
  value = module.gke.region
}

output "cluster_name" {
  description = "Cluster name"
  value       = var.cluster_name
}

output "location" {
  value = module.gke.location
}

output "zones" {
  description = "List of zones in which the cluster resides"
  value       = module.gke.zones
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.gke.service_account
}

