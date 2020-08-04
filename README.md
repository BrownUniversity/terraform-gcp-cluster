# Core/User Cluster

![kitchen-tests](https://github.com/BrownUniversity/terraform-gcp-cluster/workflows/kitchen-tests/badge.svg)


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
code by adding a `module` configuration and setting its `source` parameter to URL of this repository. See the [examples](/examples) folder for guidance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12 |
| google | ~> 3.0 |
| google-beta | ~> 3.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of cluster | `string` | `"default"` | no |
| core\_pool\_auto\_repair | Enable auto-repair of core-component pool | `bool` | `true` | no |
| core\_pool\_auto\_upgrade | Enable auto-upgrade of core-component pool | `bool` | `true` | no |
| core\_pool\_disk\_size\_gb | Size of disk for core-component pool | `number` | `100` | no |
| core\_pool\_disk\_type | Type of disk core-component pool | `string` | `"pd-standard"` | no |
| core\_pool\_image\_type | Type of image core-component pool | `string` | `"COS"` | no |
| core\_pool\_initial\_node\_count | Number of initial nodes in core-component pool | `number` | `1` | no |
| core\_pool\_local\_ssd\_count | Number of SSDs core-component pool | `number` | `0` | no |
| core\_pool\_machine\_type | Machine type for the core-component pool | `string` | `"n1-highmem-4"` | no |
| core\_pool\_max\_count | Maximum number of nodes in the core-component pool | `number` | `3` | no |
| core\_pool\_min\_count | Minimum number of nodes in the core-component pool | `number` | `1` | no |
| core\_pool\_name | Name for the core-component pool | `string` | `"core-pool"` | no |
| core\_pool\_oauth\_scope | OAuth scope for core-component pool | `string` | `"https://www.googleapis.com/auth/cloud-platform"` | no |
| core\_pool\_preemptible | Make core-component pool preemptible | `bool` | `false` | no |
| create\_service\_account | Defines if service account specified to run nodes should be created. | `bool` | `false` | no |
| enable\_private\_nodes | (Beta) Whether nodes have internal IP addresses only | `bool` | `false` | no |
| gke\_version | Major version of GKE | `string` | `"~\u003e 6.0"` | no |
| horizontal\_pod\_autoscaling | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| http\_load\_balancing | Enable http load balancer add-on | `bool` | `false` | no |
| ip\_range\_pods | The range name for pods | `string` | `"kubernetes-pods"` | no |
| ip\_range\_services | The range name for services | `string` | `"kubernetes-services"` | no |
| logging\_service | The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| maintenance\_start\_time | Time window specified for daily maintenance operations in RFC3339 format | `string` | `"03:00"` | no |
| master\_ipv4\_cidr\_block | (Beta) The IP range in CIDR notation to use for the hosted master network | `string` | `"172.16.0.0/28"` | no |
| monitoring\_service | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| network | The VPC network to host the cluster in. | `string` | `"kubernetes-vpc"` | no |
| network\_policy | Enable network policy addon | `bool` | `true` | no |
| node\_zones | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list` | <pre>[<br>  "us-east1-b"<br>]</pre> | no |
| project\_id | The project ID to host the cluster in | `string` | n/a | yes |
| region | The region to host the cluster in | `string` | n/a | yes |
| regional | Whether the master node should be regional or zonal | `bool` | `true` | no |
| remove\_default\_node\_pool | Remove default node pool while setting up the cluster | `bool` | `false` | no |
| service\_account\_email | Email of service account | `string` | n/a | yes |
| skip\_provisioners | Flag to skip local-exec provisioners | `bool` | `false` | no |
| subnetwork | The subnetwork to host the cluster in | `string` | `"kubernetes-subnet"` | no |
| user\_pool\_auto\_repair | Enable auto-repair of user pool | `bool` | `true` | no |
| user\_pool\_auto\_upgrade | Enable auto-upgrade of user pool | `bool` | `true` | no |
| user\_pool\_disk\_size\_gb | Size of disk for user pool | `number` | `100` | no |
| user\_pool\_disk\_type | Type of disk user pool | `string` | `"pd-standard"` | no |
| user\_pool\_image\_type | Type of image user pool | `string` | `"COS"` | no |
| user\_pool\_initial\_node\_count | Number of initial nodes in user pool | `number` | `1` | no |
| user\_pool\_local\_ssd\_count | Number of SSDs user pool | `number` | `0` | no |
| user\_pool\_machine\_type | Machine type for the user pool | `string` | `"n1-highmem-4"` | no |
| user\_pool\_max\_count | Maximum number of nodes in the user pool | `number` | `20` | no |
| user\_pool\_min\_count | Minimum number of nodes in the user pool | `number` | `1` | no |
| user\_pool\_name | Name for the user pool | `string` | `"user-pool"` | no |
| user\_pool\_oauth\_scope | OAuth scope for user pool | `string` | `"https://www.googleapis.com/auth/cloud-platform"` | no |
| user\_pool\_preemptible | Make user pool preemptible | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_name | Cluster name |
| location | n/a |
| region | n/a |
| service\_account | The service account to default running nodes as if not overridden in `node_pools`. |
| zones | List of zones in which the cluster resides |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing

This repository uses Kitchen-Terraform to test the terraform modules. In the [examples](/examples)directory you can find examples of how each module can be used. Those examples are fed to [Test Kitchen][https://kitchen.ci/]. To install test kitchen, first make sure you have Ruby and bundler installed.

```
brew install ruby
gem install bundler
```

Then install the prerequisites for test kitchen.

```
bundle install
```

You'll need to add some common credentials and secret variables

And now you're ready to run test kitchen. Test kitchen has a couple main commands:

- `bundle exec kitchen create` initializes terraform.
- `bundle exec kitchen converge` runs our terraform examples.
- `bundle exec kitchen verify` runs our inspec scripts against a converged kitchen.
- `bundle exec kitchen test` does all the above.


## Development

### Merging Policy
Use [GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#production-branch-with-gitlab-flow).

* Create feature branches for features and fixes from default branch
* Merge only from PR with review
* After merging to default branch a release is drafted using a github action. Check the draft and publish if you and tests are happy

### Pre-commit hooks
Install and configure terraform [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform)
This repository has the following hooks, preonfigured. After intallation, you can run them using: `pre-commit run -a`
Please make sure you run them before pushing to remote.

| Hook name                                        | Description                                                                                                                |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| `terraform_fmt`                                  | Rewrites all Terraform configuration files to a canonical format.                                                          |
| `terraform_docs`                                 | Inserts input and output documentation into `README.md`.                                                       |
| `terraform_tflint`                               | Validates all Terraform configuration files with [TFLint](https://github.com/terraform-linters/tflint).                              |
| `terraform_tfsec`                                | [TFSec](https://github.com/liamg/tfsec) static analysis of terraform templates to spot potential security issues.     |


### CI
This project has three workflows enabled:

1. PR labeler: When openning a PR to defaukt branch, a label is given assigned automatically accourding to the name of your feature branch. The labeler follows the follows rules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Realease Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. `Kitchen test` is run on every commit unless `[skip ci]` is added to commit message.
