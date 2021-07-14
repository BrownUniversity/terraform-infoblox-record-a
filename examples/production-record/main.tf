locals {
  record_ip       = "35.196.28.198"
  record_hostname = "inspec"
  record_domain   = "jupyter.brown.edu"
}

module "production_infoblox_record" {
  source          = "../../"
  record_ip       = local.record_ip
  record_hostname = local.record_hostname
  record_domain   = local.record_domain
  record_dns_view = "production"
}

