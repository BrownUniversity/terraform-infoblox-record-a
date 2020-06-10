locals {
  record_ip       = "35.196.28.198"
  record_hostname = "inspec"
  record_domain   = "jupyter.brown.edu"
}

module "production_infoblox_record" {
  source            = "../../"
  infoblox_username = var.infoblox_username
  infoblox_password = var.infoblox_password
  infoblox_host     = "gm.brown.edu"
  record_ip         = local.record_ip
  record_hostname   = local.record_hostname
  record_domain     = local.record_domain
  record_dns_view   = "production"
}

