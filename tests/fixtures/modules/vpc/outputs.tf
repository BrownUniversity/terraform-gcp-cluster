# ---------------------------------------------------------------
#  VPC Outputs
# ---------------------------------------------------------------

output network_name {
  value = module.simple_vpc.network_name
}

output subnetwork {
  value = "${module.simple_vpc.subnets_names.0}"
}

output subnets_self_links {
  value = module.simple_vpc.subnets_self_links
}

output subnets_ips {
  value = module.simple_vpc.subnets_ips
}

output subnets_secondary_ranges {
  value = module.simple_vpc.subnets_secondary_ranges
}