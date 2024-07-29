run "create_brown_modules_cluster" {

  module {
    source = "./tests/brown-modules-cluster"
  }

  assert {
    condition    = output.project_id != ""
    error_message = "Project ID should not be empty"
  }

  assert {
      condition     = output.project_name == "inspec-cluster-brown"
      error_message = "Project name is incorrect"
  }

  assert {
    condition     = output.location == "us-east1-b"
    error_message = "Cluster location does not match expected value"
  }

  assert {
    condition     = output.service_account != ""
    error_message = "Service account should not be empty"
  }

  assert {
    condition     = output.region == "us-east1"
    error_message = "Cluster name should not be empty"
  }

  assert {
    condition     = output.cluster_name != ""
    error_message = "Cluster name should not be empty"
  }

  assert {
    condition     = output.network_name == "network-01"
    error_message = "Cluster network does not match the created network"
  }

  assert {
    condition     = output.subnet_name == "subnet-01"
    error_message = "Cluster subnetwork does not match the created subnetwork"
  }
}
