# ---------------------------------------------------------------
#  GKE Outputs
# ---------------------------------------------------------------


output "project_id" {
  value = module.gke.project_id
}

output "region" {
  value = module.gke.region
}

output "cluster_name" {
  description = "Cluster name"
  value       = var.cluster_name
}

output "network" {
  value = google_compute_network.main.name
}

output "subnetwork" {
  value = google_compute_subnetwork.main.name
}

output "location" {
  value = module.gke.location
}

output "ip_range_pods" {
  description = "The secondary IP range used for pods"
  value       = google_compute_subnetwork.main.secondary_ip_range[0].range_name
}

output "ip_range_services" {
  description = "The secondary IP range used for services"
  value       = google_compute_subnetwork.main.secondary_ip_range[1].range_name
}

output "zones" {
  description = "List of zones in which the cluster resides"
  value       = module.gke.zones
}

output "master_kubernetes_version" {
  description = "The master Kubernetes version"
  value       = module.gke.master_kubernetes_version
}

output "kubernetes_endpoint" {
  sensitive = true
  value     = module.gke.kubernetes_endpoint
}

output "client_token" {
  sensitive = true
  value     = base64encode(data.google_client_config.default.access_token)
}

output "ca_certificate" {
  description = "The cluster CA certificate"
  value       = module.gke.ca_certificate
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.gke.service_account
}

output "database_encryption_key_name" {
  value = google_kms_crypto_key.db.self_link
}

output "identity_namespace" {
  value = module.gke.identity_namespace
}

