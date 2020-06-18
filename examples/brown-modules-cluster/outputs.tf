output "project_id" {
  value = module.project.project_id
}

output "project_name" {
  value = local.project_name
}

output "network_prefix" {
  value = local.network_prefix
}

output "region" {
  value = module.simple_cluster.region
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.simple_cluster.cluster_name
}


output "location" {
  value = module.simple_cluster.location
}

output "zones" {
  description = "List of zones in which the cluster resides"
  value       = module.simple_cluster.zones
}

output "master_kubernetes_version" {
  description = "The master Kubernetes version"
  value       = module.simple_cluster.master_kubernetes_version
}

output "kubernetes_endpoint" {
  sensitive = true
  value     = module.simple_cluster.kubernetes_endpoint
}

output "client_token" {
  sensitive = true
  value     = module.simple_cluster.client_token
}

output "ca_certificate" {
  description = "The cluster CA certificate"
  value       = module.simple_cluster.ca_certificate
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.simple_cluster.service_account
}

output "network_name" {
    value = module.vpc.network_name
}

output "subnet_name" {
    value = module.vpc.subnet_name
}

output "subnet_region" {
    value = module.vpc.subnet_region
}

output "routing_mode" {
  value = module.vpc.routing_mode
}

output "subnet_ip" {
  value = module.vpc.subnet_ip
}