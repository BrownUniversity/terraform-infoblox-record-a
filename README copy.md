# INFOBLOX A-RECORD

This folder contains a [Terraform](https://www.terraform.io/) module to create an a-record in infoblox

## Intalling the InfoBlox provider

This was an adventure and should be revisited in the future.
The official [infoblox provider](https://github.com/infobloxopen/terraform-provider-infoblox) was not used because of lack of examples and lack of clarity of the values and resources needed. We should probably figure it out in the future.

Another "popular" provider is [this one](https://github.com/prudhvitella/terraform-provider-infoblox) - but at the time of writing 12.20.2020, it wasn't working witih Terraform v0.12.x

We ended up using [this fork](https://github.com/RobCannon/terraform-provider-infoblox) with branch terraformv0.12.0. We also have a [fork](https://github.com/brown-ccv/terraform-provider-infoblox) with a tagged release for reference

To install the provider as a plugin you need to

### Installing go

In mac
```
brew install go
```

You also want to add the following to your bash_profile

```
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
```

### Install gox

```
go get github.com/mitchellh/gox
```

### Install infoblox provider

```
mkdir $GOPATH/src/github.com/RobCannon
cd $GOPATH/src/github.com/RobCannon
git clone https://github.com/RobCannon/terraform-provider-infoblox.git
cd terraform-provider-infoblox/
git fetch
git checkout terraformv0.12.0
make bin
```

This provider puts the teterraform-provider-infoblox binary in cp /`~/.terraform/darwin_amd64/terraform-provider-infoblox_v0.2.0` however, the path for plugins from the [official documetation](https://www.terraform.io/docs/plugins/basics.html#installing-a-plugin) is different.

In Mac or Linux:
```
cp ~/.terraform/darwin_amd64/terraform-provider-infoblox_v0.2.0 ~/.terraform.d/plugins/terraform-provider-infoblox_v0.2.0
```

At this point, you should run `terraform init` from your main terraform project and the plugin will be auto-detected


## How do you use this module?

This folder defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this folder. For instance the main code for renku invokes this module as follows

```hcl
module "jhub_infoblox" {
  source = "./modules/infoblox"
  infoblox_username = var.infoblox_username
  infoblox_password = var.infoblox_password
  infoblox_host   = var.infoblox_host
  static_ip_address = module.jhub_project.static_ip_address
  domain_name       = var.domain_name
}
```