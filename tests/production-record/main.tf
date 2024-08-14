terraform {
  required_version = "1.9.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
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

variable "record_hostname" {
  type    = string
  default = "inspec"
}

variable "record_domain" {
  type    = string
  default = "jupyter.brown.edu"
}

variable "record_ip" {
  type    = string
  default = "127.0.0.1"
}

variable "record_dns_view" {
  type    = string
  default = "production"
}

output "random_string" {
  value = random_string.random.result
}


