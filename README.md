# Core/User Cluster

![terraform-tests](https://github.com/BrownUniversity/terraform-gcp-cluster/workflows/terraform-tests/badge.svg)


This folder contains a [Terraform](https://www.terraform.io/) module to deploy a 
kubernetes cluster in [GCP](https://cloud.google.com/).
The cluster contains a core-node-pool and an user-node-pool. The cluster is configured to schedule user pods into the user pool. This cluster type is used by JupyterHub and Renku projects


# Contents:

- [Getting Started](#getting-started)
- [How to use this module](#how-to-use-this-module)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Testing](#testing)
- [Development](#development)

## Getting Started

This module depends on you having GCP credentials of some kind. The module looks for a credential file in JSON format. You should export the following:

```
GOOGLE_APPLICATION_CREDENTIALS=/path/to/file.json
```
## How to use this module

This repository defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this repository. See the [tests](/tests) folder for guidance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.15.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 6.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster | 34.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of cluster | `string` | `"default"` | no |
| <a name="input_core_pool_auto_repair"></a> [core\_pool\_auto\_repair](#input\_core\_pool\_auto\_repair) | Enable auto-repair of core-component pool | `bool` | `true` | no |
| <a name="input_core_pool_auto_upgrade"></a> [core\_pool\_auto\_upgrade](#input\_core\_pool\_auto\_upgrade) | Enable auto-upgrade of core-component pool | `bool` | `true` | no |
| <a name="input_core_pool_disk_size_gb"></a> [core\_pool\_disk\_size\_gb](#input\_core\_pool\_disk\_size\_gb) | Size of disk for core-component pool | `number` | `100` | no |
| <a name="input_core_pool_disk_type"></a> [core\_pool\_disk\_type](#input\_core\_pool\_disk\_type) | Type of disk core-component pool | `string` | `"pd-standard"` | no |
| <a name="input_core_pool_image_type"></a> [core\_pool\_image\_type](#input\_core\_pool\_image\_type) | Type of image core-component pool | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_core_pool_initial_node_count"></a> [core\_pool\_initial\_node\_count](#input\_core\_pool\_initial\_node\_count) | Number of initial nodes in core-component pool | `number` | `1` | no |
| <a name="input_core_pool_local_ssd_count"></a> [core\_pool\_local\_ssd\_count](#input\_core\_pool\_local\_ssd\_count) | Number of SSDs core-component pool | `number` | `0` | no |
| <a name="input_core_pool_machine_type"></a> [core\_pool\_machine\_type](#input\_core\_pool\_machine\_type) | Machine type for the core-component pool | `string` | `"n1-highmem-4"` | no |
| <a name="input_core_pool_max_count"></a> [core\_pool\_max\_count](#input\_core\_pool\_max\_count) | Maximum number of nodes in the core-component pool | `number` | `3` | no |
| <a name="input_core_pool_min_count"></a> [core\_pool\_min\_count](#input\_core\_pool\_min\_count) | Minimum number of nodes in the core-component pool | `number` | `1` | no |
| <a name="input_core_pool_name"></a> [core\_pool\_name](#input\_core\_pool\_name) | Name for the core-component pool | `string` | `"core-pool"` | no |
| <a name="input_core_pool_preemptible"></a> [core\_pool\_preemptible](#input\_core\_pool\_preemptible) | Make core-component pool preemptible | `bool` | `false` | no |
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | Defines if service account specified to run nodes should be created. | `bool` | `false` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | (Beta) Whether nodes have internal IP addresses only | `bool` | `true` | no |
| <a name="input_gce_pd_csi_driver"></a> [gce\_pd\_csi\_driver](#input\_gce\_pd\_csi\_driver) | (Beta) Whether this cluster should enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver. | `bool` | `true` | no |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| <a name="input_http_load_balancing"></a> [http\_load\_balancing](#input\_http\_load\_balancing) | Enable http load balancer add-on | `bool` | `false` | no |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | The range name for pods | `string` | `"kubernetes-pods"` | no |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | The range name for services | `string` | `"kubernetes-services"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region. | `string` | `"latest"` | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_maintenance_start_time"></a> [maintenance\_start\_time](#input\_maintenance\_start\_time) | Time window specified for daily maintenance operations in RFC3339 format | `string` | `"03:00"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | (Beta) The IP range in CIDR notation to use for the hosted master network | `string` | `"172.16.0.0/28"` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network to host the cluster in. | `string` | `"kubernetes-vpc"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `true` | no |
| <a name="input_node_zones"></a> [node\_zones](#input\_node\_zones) | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list(string)` | <pre>[<br>  "us-east1-b"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the cluster in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in | `string` | n/a | yes |
| <a name="input_regional"></a> [regional](#input\_regional) | Whether the master node should be regional or zonal | `bool` | `true` | no |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `REGULAR`. | `string` | `"REGULAR"` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | Remove default node pool while setting up the cluster | `bool` | `false` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | Email of service account | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to host the cluster in | `string` | `"kubernetes-subnet"` | no |
| <a name="input_user_pool_auto_repair"></a> [user\_pool\_auto\_repair](#input\_user\_pool\_auto\_repair) | Enable auto-repair of user pool | `bool` | `true` | no |
| <a name="input_user_pool_auto_upgrade"></a> [user\_pool\_auto\_upgrade](#input\_user\_pool\_auto\_upgrade) | Enable auto-upgrade of user pool | `bool` | `true` | no |
| <a name="input_user_pool_disk_size_gb"></a> [user\_pool\_disk\_size\_gb](#input\_user\_pool\_disk\_size\_gb) | Size of disk for user pool | `number` | `100` | no |
| <a name="input_user_pool_disk_type"></a> [user\_pool\_disk\_type](#input\_user\_pool\_disk\_type) | Type of disk user pool | `string` | `"pd-standard"` | no |
| <a name="input_user_pool_image_type"></a> [user\_pool\_image\_type](#input\_user\_pool\_image\_type) | Type of image user pool | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_user_pool_initial_node_count"></a> [user\_pool\_initial\_node\_count](#input\_user\_pool\_initial\_node\_count) | Number of initial nodes in user pool | `number` | `1` | no |
| <a name="input_user_pool_local_ssd_count"></a> [user\_pool\_local\_ssd\_count](#input\_user\_pool\_local\_ssd\_count) | Number of SSDs user pool | `number` | `0` | no |
| <a name="input_user_pool_machine_type"></a> [user\_pool\_machine\_type](#input\_user\_pool\_machine\_type) | Machine type for the user pool | `string` | `"n1-highmem-4"` | no |
| <a name="input_user_pool_max_count"></a> [user\_pool\_max\_count](#input\_user\_pool\_max\_count) | Maximum number of nodes in the user pool | `number` | `20` | no |
| <a name="input_user_pool_min_count"></a> [user\_pool\_min\_count](#input\_user\_pool\_min\_count) | Minimum number of nodes in the user pool | `number` | `1` | no |
| <a name="input_user_pool_name"></a> [user\_pool\_name](#input\_user\_pool\_name) | Name for the user pool | `string` | `"user-pool"` | no |
| <a name="input_user_pool_preemptible"></a> [user\_pool\_preemptible](#input\_user\_pool\_preemptible) | Make user pool preemptible | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Cluster name |
| <a name="output_horizontal_pod_autoscaling_enabled"></a> [horizontal\_pod\_autoscaling\_enabled](#output\_horizontal\_pod\_autoscaling\_enabled) | Whether the cluster enables horizontal pod autoscaling |
| <a name="output_http_load_balancing_enabled"></a> [http\_load\_balancing\_enabled](#output\_http\_load\_balancing\_enabled) | Whether the cluster enables HTTP load balancing |
| <a name="output_location"></a> [location](#output\_location) | The location (region or zone) in which the cluster master will be created |
| <a name="output_node_pools_names"></a> [node\_pools\_names](#output\_node\_pools\_names) | List of node pools names |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | The service account to default running nodes as if not overridden in `node_pools`. |
| <a name="output_zones"></a> [zones](#output\_zones) | List of zones in which the cluster resides |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Local Development

### Merging Policy
Use [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#production-branch-with-gitlab-flow).

* Create feature branches for features and fixes from default branch
* Merge only from PR with review
* After merging to default branch a release is drafted using a github action. Check the draft and publish if you and tests are happy

### Version managers

We recommend using [asdf](https://asdf-vm.com) to manage your versions of Terrafom.

```
brew install asdf
```

### Terraform

You can also install the latest version of terraform version via brew.

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

#### Pre-commit hooks
You should make sure that pre-commit hooks are installed to run the formater, linter, etc. Install and configure terraform [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform) as follows:

Install dependencies

```
brew bundle install
```

Install the pre-commit hook globally
```
DIR=~/.git-template
git config --global init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}
```

To run the hooks specified in `.pre-commit-config.yaml`: 

```
pre-commit run -a
```

### GCloud

This is only needed if running tests locally. The google-cloud-sdk is included in the Brewfile so it should now be installed
This repo includes a `env.sh` file that where you set the path to the google credentials file, then use

```
source env.sh
```

and

```
deactivate
```

to set and uset the `GOOGLE_APPLICATION_CREDENTIALS` variable.


### Testing

The tests can be run locally with `terraform test` after running `terraform init`. You will need to supply `org_id`, `folder_id`, and `billing_account` variables through `terraform.tfvars` file. Please see `terraform.tfvars.example` file for an example.


### CI
This project has three workflows enabled:

1. PR labeler: When opening a PR to default branch, a label is given assigned automatically according to the name of your feature branch. The labeler follows the follows rules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Release Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. `terraform test` runs on PR, merge to main and releases.