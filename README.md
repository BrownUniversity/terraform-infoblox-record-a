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

You will need Infobox credentials and permission of the specified zone and view. The Infoblox server must also be reachable within your network

## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. See the [examples](/examples) folder for guidance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12 |
| infoblox | v1.0.0 |
| infoblox | >= 1.0, <2.0.0 |

## Providers

| Name | Version |
|------|---------|
| infoblox | v1.0.0 >= 1.0, <2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Enable this resource? This can go away with terraform v0.13 | `bool` | `true` | no |
| infoblox\_host | Infoblox host | `string` | n/a | yes |
| infoblox\_password | Password to authenticate with Infoblox server | `string` | n/a | yes |
| infoblox\_username | Username to authenticate with Infoblox server | `string` | n/a | yes |
| record\_dns\_view | DNS View under which the zone has been created. | `string` | n/a | yes |
| record\_domain | The domain on the record. hostaname.domain = FQDN | `string` | n/a | yes |
| record\_hostname | The domain on the record. hostaname.domain = FQDN | `string` | n/a | yes |
| record\_ip | Static IP for the a-record | `string` | n/a | yes |
| ssl\_mode | Use SSL when connecting to infoblox server | `bool` | `false` | no |

## Outputs

No output.

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

