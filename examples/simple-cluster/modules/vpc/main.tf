# ------------------------------------------------------------
#   PROVIDER BLOCK
# ------------------------------------------------------------

provider "google-beta" {
  credentials = var.credentials_path
  version     = "~> 3.0"
}

provider "google" {
  credentials = var.credentials_path
  version     = "~> 3.0"
}

# ---------------------------------------------------------------------------------------------------------------------
#  CREATE A SIMPLE VPC
# ---------------------------------------------------------------------------------------------------------------------

# Create the VPC, Subnets and Secondary Ranges
module "simple_vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.0.0"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = var.routing_mode
  subnets = [
    {
      subnet_name           = var.subnet_name
      subnet_ip             = var.subnet_ip
      subnet_region         = var.subnet_region
      subnet_private_access = var.subnet_private_access
      subnet_flow_logs      = var.subnet_flow_logs
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description           = var.description
    },
  ]

  secondary_ranges = {
    "${var.subnet_name}" = [
      {
        range_name    = var.range_name_pods
        ip_cidr_range = var.ip_range_pods
      },
      {
        range_name    = var.range_name_services
        ip_cidr_range = var.ip_range_services
      }

    ]
  }
}