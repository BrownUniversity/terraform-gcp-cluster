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

output "routing_mode" {
  value = module.vpc.routing_mode
}

output "subnet_ip" {
  value = module.vpc.subnet_ip
}
