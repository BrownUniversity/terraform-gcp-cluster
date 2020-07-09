output "project_id" {
  value = module.project.project_id
}

output "project_name" {
  value = local.project_name
}

output "network_prefix" {
  value = local.network_prefix
}

output "random_string" {
  value = random_string.suffix.result
}

output "region" {
  value = module.simple_cluster.region
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.simple_cluster.cluster_name
}

output "network" {
  value = google_compute_network.main.name
}

output "subnetwork" {
  value = google_compute_subnetwork.main.name
}

output "location" {
  value = module.simple_cluster.location
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
  value       = module.simple_cluster.zones
}

output "master_kubernetes_version" {
  description = "The master Kubernetes version"
  value       = module.simple_cluster.master_kubernetes_version
}

output "ca_certificate" {
  description = "The cluster CA certificate"
  value       = module.simple_cluster.ca_certificate
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.simple_cluster.service_account
}
