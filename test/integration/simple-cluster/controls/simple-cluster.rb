# copyright: 2018, The Authors

title "Cluster Section"

project_id = attribute('project_id')
project_name= attribute('project_name')
location = attribute('location')
service_account = attribute('service_account')
network_name = attribute('network_prefix') + '-' + attribute('random_string')
cluster_name = attribute('cluster_name')


# Project Tests
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

# K8s Cluster Test
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
  its('node_config.image_type'){should be_in ["COS", "COS_CONTAINERD"]}
  its('node_config.machine_type'){should be_in ["n1-standard-1", "e2-medium"]}
  its('node_pools.count'){should eq 3}
  its('node_config.oauth_scopes'){should eq ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring"]}
  its('node_config.service_account'){should eq service_account}
end

# Node Pool Tests
describe google_container_node_pools(project: project_id, location: location, cluster_name: cluster_name) do
  its('node_pool_names') { should include "default-pool" }
  its('node_pool_names') { should include "user-pool" }
  its('node_pool_names') { should include "core-pool" }

end

google_container_node_pools(project: project_id, location: location, cluster_name: cluster_name).where(node_pool_name: /-pool$/).node_pool_names.each do |node_pool_name|
  describe google_container_node_pool(project: project_id, location: location, cluster_name: cluster_name, nodepool_name: node_pool_name) do
    it { should exist }
    its('status') { should eq 'RUNNING' }
  end
end


