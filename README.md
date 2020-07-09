# Renku Cluster

This folder contains a [Terraform](https://www.terraform.io/) module to deploy a 
kubernetes cluster in [GCP](https://cloud.google.com/).
The cluster contains a core-node-pool and an user-node-pool. The cluster is configured to schedule user pods into the user pool



## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. See See the [examples](/examples) folder for guidance

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

You'll need to add some common credentials. Copy the `examples/shared/terraform.tfvars.example` to `examples/shared/terraform.tfvars` and run the commands in the file to find the billing account id and the organization id.

And now you're ready to run test kitchen. Test kitchen has a couple main commands:

- `bundle exec kitchen create` initializes terraform.
- `bundle exec kitchen converge` runs our terraform examples.
- `bundle exec kitchen verify` runs our inspec scripts against a converged kitchen.
- `bundle exec kitchen test` does all the above.
