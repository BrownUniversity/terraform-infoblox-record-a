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
