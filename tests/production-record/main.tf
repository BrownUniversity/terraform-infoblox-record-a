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
  record_ip       = var.record_ip
  record_hostname = "${var.record_hostname}${random_string.random.result}"
  record_domain   = var.record_domain
  record_dns_view = var.record_dns_view
}

variable "record_hostname" {
  default = "inspec"
}

variable "record_domain" {
  default = "jupyter.brown.edu"
}

variable "record_ip" {
  default = "127.0.0.1"
}

variable "record_dns_view" {
  default = "production"
}

output "random_string" {
  value = random_string.random.result
}


