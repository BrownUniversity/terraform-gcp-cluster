# renku Cluster

This folder contains a [Terraform](https://www.terraform.io/) module to deploy a 
kubernetes cluster in [GCP](https://cloud.google.com/).
The cluster contains a core-node-pool and an user-node-pool. The cluster is configured to schedule user pods into the user pool



## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. For instance the main code for renku invokes this module as follows

```hcl
module "renku_cluster" {
  source                      = "./modules/cluster"

  credentials_path           = var.credentials_path
  project_id                   = module.renku_project.project_id
  cluster_name_suffix         = var.cluster_name_suffix
  regional                    = var.regional
  region                      = var.region
  network_name                = module.renku_vpc.network_name
  subnetwork                  = module.renku_vpc.subnetwork
  # range_name_pods             = var.range_name_pods
  # range_name_services         = var.range_name_services
  logging_service             = var.logging_service
  monitoring_service          = var.monitoring_service
  maintenance_start_time      = var.maintenance_start_time
  create_service_account      = var.create_service_account
  service_account_email       = module.renku_project.service_account_email
  skip_provisioners           = var.skip_provisioners
  http_load_balancing         = var.http_load_balancing
  horizontal_pod_autoscaling  = var.horizontal_pod_autoscaling
  network_policy              = var.network_policy
  enable_private_nodes        = var.enable_private_nodes
  master_ipv4_cidr_block      = var.master_ipv4_cidr_block
  remove_default_node_pool    = var.remove_default_node_pool


  core_pool_name               = var.core_pool_name
  core_pool_machine_type       = var.core_pool_machine_type
  core_pool_min_count          = var.core_pool_min_count
  core_pool_max_count          = var.core_pool_max_count
  core_pool_local_ssd_count    = var.core_pool_local_ssd_count
  core_pool_disk_size_gb       = var.core_pool_disk_size_gb
  core_pool_disk_type          = var.core_pool_disk_type
  core_pool_image_type         = var.core_pool_image_type
  core_pool_auto_repair        = var.core_pool_auto_repair
  core_pool_auto_upgrade       = var.core_pool_auto_upgrade
  core_pool_preemptible        = var.core_pool_preemptible
  core_pool_initial_node_count = var.core_pool_initial_node_count

  user_pool_name               = var.user_pool_name
  user_pool_machine_type       = var.user_pool_machine_type
  user_pool_min_count          = var.user_pool_min_count
  user_pool_max_count          = var.user_pool_max_count
  user_pool_local_ssd_count    = var.user_pool_local_ssd_count
  user_pool_disk_size_gb       = var.user_pool_disk_size_gb
  user_pool_disk_type          = var.user_pool_disk_type
  user_pool_image_type         = var.user_pool_image_type
  user_pool_auto_repair        = var.user_pool_auto_repair
  user_pool_auto_upgrade       = var.user_pool_auto_upgrade
  user_pool_preemptible        = var.user_pool_preemptible
  user_pool_initial_node_count = var.user_pool_initial_node_count
  
}
```