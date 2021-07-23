# terraform-infoblox-record-a

[Terraform](https://www.terraform.io/) module for creating a-records via Infoblox.

The example includes typical values used at Brown University

<!-- update badge link below for your repo! -->
![kitchen-tests](https://github.com/BrownUniversity/terraform-infoblox-record-a/workflows/kitchen-tests/badge.svg)


# Contents:

- [Getting Started](#getting-started)
- [How to use this module](#how-to-use-this-module)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Testing](#testing)
- [Development](#development)


## Getting Started

If developing locally, this module depends on you having GCP credentials of some kind. The module looks for a credential file in JSON format. You should export the following:

```
GOOGLE_APPLICATION_CREDENTIALS=/path/to/file.json
```
If the credentials are set correctly, the basic gcloud infrastructure is successfully created

You will also need Infobox credentials and permission of the specified zone and view. The Infoblox server must also be reachable within your network.
For Brown users we recommend using `lastpass-cli` to source your secrets into environment variables (ask for access to creds)., ie

```
export INFOBLOX_USERNAME=$(lpass show infoblox --username)
export INFOBLOX_PASSWORD=$(lpass show infoblox --password)
export INFOBLOX_SERVER=$(lpass show infoblox --url | awk -F/ '{print $3}')
```

The following envs are required

```
INFOBLOX_USERNAME
INFOBLOX_PASSWORD
INFOBLOX_SERVER
```


## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. See the [examples](/examples) folder for guidance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_infoblox"></a> [infoblox](#requirement\_infoblox) | >= 1.0, <2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_infoblox"></a> [infoblox](#provider\_infoblox) | >= 1.0, <2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [infoblox_a_record.a_record](https://registry.terraform.io/providers/infobloxopen/infoblox/latest/docs/resources/a_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable this resource? This can go away with terraform v0.13 | `bool` | `true` | no |
| <a name="input_record_dns_view"></a> [record\_dns\_view](#input\_record\_dns\_view) | DNS View under which the zone has been created. | `string` | n/a | yes |
| <a name="input_record_domain"></a> [record\_domain](#input\_record\_domain) | The domain on the record. hostaname.domain = FQDN | `string` | n/a | yes |
| <a name="input_record_hostname"></a> [record\_hostname](#input\_record\_hostname) | The domain on the record. hostaname.domain = FQDN | `string` | n/a | yes |
| <a name="input_record_ip"></a> [record\_ip](#input\_record\_ip) | Static IP for the a-record | `string` | n/a | yes |
| <a name="input_ssl_mode"></a> [ssl\_mode](#input\_ssl\_mode) | Use SSL when connecting to infoblox server | `bool` | `false` | no |

## Outputs

No outputs.
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
To run them: `pre-commit run -a`

### CI
This project has three workflows enabled:

1. PR labeler: When openning a PR to default branch, a label is given automatically according to the name of your feature branch. The labeler follows thenrules in [pr-labeler.yml](.github/pr-labeler.yml)

2. Release Drafter: When merging to master, a release is drafted using the [Release-Drafter Action](https://github.com/marketplace/actions/release-drafter)

3. Kitchen test: ⚠️This workflow runs on a self-hosted runner baceuse `infoblox` is behind our network. For scurity reasons it only runs on a manual dispatch so that the self-hosted runner is not exposed to outside PRs. In the self hosted runner there are important considarations about cleanning up files and dangling docker images. Also to avoid permission errors due to the container action writing files as ROOT, cleaning prior to checkout has been disabled. contains three jobs:
    
    * Build and push docker image. 
    * Kitchen tests
    * Clean up dangling images on self-hosteds

### Maintenance/Upgrades

We aim to upgrade this package at least once a year.

#### Update Ruby Version
To install/upgrade the version of Ruby we use `rbenv`. For instance to install and update to `2.7.3`:

```
rbenv install -v 2.7.3
rbenv local 2.7.3
```

This will update the `.ruby-version` file if necessary

#### Gemfile

Look at the Gemfile and the output of `bundle outdated` to decide what to update. Usually I update the versions in the Gemfile directly, then type `bundle update`

### Update the version of Terraform

Use `tfenv` to manage your versions of terraform. You can update the version in the `.terraform-version` file and run `tfenv install` and `tf use` to install and use the version specified in the file.

You should also update the version of terraform specified in the `versions.tf` file
