terraform {
  required_version = ">= 1.12.2"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

resource "random_string" "random" {
  length  = 4
  special = false
}

module "production_infoblox_record" {
  source          = "../../"
  record_ip       = var.record_ip
  record_hostname = "${var.record_hostname}${random_string.random.result}"
  record_domain   = var.record_domain
  record_dns_view = var.record_dns_view
}


