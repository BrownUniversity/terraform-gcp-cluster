run "create_gke_cluster" {

  module {
    source = "./tests/simple-cluster"
  }

  assert {
    condition    = output.project_id != ""
    error_message = "Project ID should not be empty"
  }

  assert {
      condition     = output.project_name == "inspec-cluster-test1"
      error_message = "Project name is incorrect"
  }

  assert {
    condition     = output.location == "us-east1-b"
    error_message = "Cluster location does not match expected value"
  }

  assert {
    condition     = output.cluster_name != ""
    error_message = "Cluster name should not be empty"
  }

  assert {
    condition     = length(output.node_pools_names) == 4
    error_message = "Expected 2 node pools (core and user)"
  }

  assert {
    condition     = output.node_pools_names[0] == "core-pool"
    error_message = "First node pool should be named 'core-pool'"
  }

  assert {
    condition     = output.node_pools_names[1] == "user-pool"
    error_message = "Second node pool should be named 'user-pool'"
  }

  assert {
    condition     = !output.http_load_balancing_enabled
    error_message = "HTTP load balancing should be disabled"
  }

  assert {
    condition     = output.horizontal_pod_autoscaling_enabled
    error_message = "Horizontal pod autoscaling should be enabled"
  }

  assert {
    condition     = google_compute_network.main.name == "${output.network_prefix}-${output.random_string}"
    error_message = "Cluster network does not match the created network"
  }

  assert {
    condition     = google_compute_subnetwork.main.name == "${output.network_prefix}-${output.random_string}"
    error_message = "Cluster subnetwork does not match the created subnetwork"
  }

  assert {
    condition     = output.service_account != ""
    error_message = "Service account should not be empty"
  }
}
