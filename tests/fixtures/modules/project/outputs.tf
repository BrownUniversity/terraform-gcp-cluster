# ---------------------------------------------------------------
#  PROJECT Output
# ---------------------------------------------------------------

output domain {
  value = module.project_factory.domain
}

output "project_name" {
  value = module.project_factory.project_name
}

output project_id {
  value = module.project_factory.project_id
}

output project_number {
  value = module.project_factory.project_number
}

output service_account_display_name {
  value = module.project_factory.service_account_display_name
}

output service_account_email {
  value = module.project_factory.service_account_email
}


# ---------------------------------------------------------------
#  Static IP Outputs
# ---------------------------------------------------------------

output static_ip_self_link {
  value = google_compute_address.static.self_link
}

output static_ip_address {
  value = google_compute_address.static.address
}