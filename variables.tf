variable "enabled" {
  description = "Enable this resource? This can go away with terraform v0.13"
  type        = bool
  default     = true
}

variable "ssl_mode" {
  description = "Use SSL when connecting to infoblox server"
  default     = false
}

variable "record_ip" {
  description = "Static IP for the a-record"
  type        = string
}

variable "record_domain" {
  description = "The domain on the record. hostaname.domain = FQDN"
  type        = string
}

variable "record_hostname" {
  description = "The domain on the record. hostaname.domain = FQDN"
  type        = string
}

variable "record_dns_view" {
  description = "DNS View under which the zone has been created."
  type        = string
}