# copyright: 2018, The Authors

title "Cluster Section"

project_id = attribute('project_id')
project_name= attribute('project_name')
location = attribute('location')
service_account = attribute('service_account')

# TODO : get the follow variables from attributes
# network_name = attribute('network_prefix') + '-' + attribute('random_string')
# cluster_name = attribute('cluster_name')

network_name = 'cft-gke-test-12i5'
cluster_name = 'default'

# you add controls here
describe google_project(project: project_id) do
  it { should exist }
  its('project_id') { should eq project_id }
end

describe google_project(project: project_id) do
  its('lifecycle_state') { should eq "ACTIVE" }
end

describe google_project(project: project_id) do
  its('name') { should eq project_name }
end


describe google_container_cluster(project: project_id, location: location, name: cluster_name) do
  # It's up and running
  it { should exist }
  its('status') { should eq 'RUNNING' }
  its('locations.sort'){ should cmp ["us-east1-b"] }


  # Has correct network and subnet names
  its('network'){should eq network_name}
  its('subnetwork'){should eq network_name}

  # Has correct node pool configuration
  its('node_config.disk_size_gb'){should eq 100}
  its('node_config.image_type'){should eq "COS"}
  its('node_config.machine_type'){should eq "n1-standard-1"}
  its('node_pools.count'){should eq 3}
  its('node_config.oauth_scopes'){should eq ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring"]}
  its('node_config.service_account'){should eq service_account}
end

