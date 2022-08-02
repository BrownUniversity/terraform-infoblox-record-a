# Required Variables

variable "record_ip" {
  description = "Static IP for the a-record"
  type        = string
}

variable "record_domain" {
  description = "The domain on portion of the FQDN. hostname.DOMAIN = FQDN"
  type        = string
}

variable "record_hostname" {
  description = "The hostname portion of the FQDN. HOSTNAME.domain = FQDN"
  type        = string
}

variable "record_dns_view" {
  description = "DNS View that contains the zone that the record is being created in."
  type        = string
}

# Optional Variables

variable "ssl_mode" {
  description = "Use SSL when connecting to infoblox server"
  type        = bool
  default     = false
}

variable "network_view" {
  description = "Used to specify the Infoblox network view to use when allocating an IP dynamically. Do not use this field unless you really know your use case"
  type        = string
  default     = null
}

variable "ttl" {
  description = "TTL value in seconds for the record. 0 disables caching. Lower values increase network traffic, High values can cause outages in case of sudden backing IP changes"
  type        = number
  default     = 3600
}

variable "ext_attrs" {
  description = "Any additional extensible attributes to set on the DNS object. Note that Tenant ID EA is already set in the module and gets merged with this value"
  type        = map(string)
  default     = {}
}