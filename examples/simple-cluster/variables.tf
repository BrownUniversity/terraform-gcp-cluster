variable "credentials_path" {}
variable "cluster_name" {}
variable "service_account_email" {}
variable "region" {}
variable org_id {}
variable billing_account {}
variable project_name {}
variable folder_id {}
variable random_project_id {
  description = "Enable random number to the end of the project."
  default     = true
}
variable auto_create_network {
  description = "Auto create default network."
  default     = true
}
variable activate_apis {
  description = "The list of apis to activate within the project	"
  default = [ 
    "compute.googleapis.com", 
    "container.googleapis.com", 
    "containerregistry.googleapis.com",
    "appengine.googleapis.com"
    ]
}
variable default_service_account {
  description = "Project default service account setting: can be one of delete, depriviledge, or keep."
  default     = "delete"
}
variable disable_dependent_services {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed."
  default     = "true"
}
variable labels {
  description = "Map of labels for project."
  default = {
    "environment" = "automation"
    "managed_by"  = "terraform"
  }
}
variable network_name {
  description = "Name of the VPC."
  default = "kubernetes-vpc"
}
variable routing_mode {
  description = "Routing mode. GLOBAL or REGIONAL"
  default     = "GLOBAL"
}
variable subnet_name {
  description = "Name of the subnet."
  default = "kubernetes-subnet"
}
variable subnet_ip {
  description = "Subnet IP CIDR."
  default = "10.0.0.0/17"
}
variable subnet_private_access {
  default = "true"
}
variable subnet_flow_logs {
  default = "true"
}
variable description {
  default = "Deployed through Terraform."
}
variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default = "192.168.0.0/18"
}
variable "ip_range_services" {
  description = "The secondary ip range to use for pods"
  default = "192.168.64.0/18"
}
variable range_name_pods {
  description = "The range name for pods"
  default     = "kubernetes-pods"
}
variable range_name_services {
  description = "The range name for services"
  default     = "kubernetes-services"
}