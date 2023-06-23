locals {
  record_ip       = "127.0.0.1"
  record_hostname = "inspec"
  record_domain   = "jupyter.brown.edu"
}

resource "random_string" "random" {
  length  = 4
  special = false
}

module "production_infoblox_record" {
  source          = "../../"
  record_ip       = local.record_ip
  record_hostname = "${local.record_hostname}${random_string.random.result}"
  record_domain   = local.record_domain
  record_dns_view = "production"
}

