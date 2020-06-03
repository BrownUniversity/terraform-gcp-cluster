variable credentials_path {
  description = "Location of the credential file."
}
variable "project_id" {
  description = "The project ID to host the VPC in"
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

variable subnet_region {
  description = "Region subnet lives in."
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