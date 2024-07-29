output "project_id" {
  value = module.project.project_id
}

output "project_name" {
  value = local.project_name
}

output "location" {
  value = module.simple_cluster.location
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.simple_cluster.service_account
}

output "network_prefix" {
  value = local.network_prefix
}

output "random_string" {
  value = random_string.suffix.result
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.simple_cluster.cluster_name
}

output "node_pools_names" {
  description = "List of node pools names"
  value       = module.simple_cluster.node_pools_names
}

output "http_load_balancing_enabled" {
  description = "Whether the cluster enables HTTP load balancing"
  value       = module.simple_cluster.http_load_balancing_enabled
}

output "horizontal_pod_autoscaling_enabled" {
  description = "Whether the cluster enables horizontal pod autoscaling"
  value       = module.simple_cluster.horizontal_pod_autoscaling_enabled
}
