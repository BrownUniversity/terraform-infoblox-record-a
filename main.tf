# ----------------------
#  PROVIDER
# ----------------------
provider "infoblox" {
  sslmode = var.ssl_mode
}

locals {
  fqdn = "${var.record_hostname}.${var.record_domain}"
}

resource "infoblox_a_record" "a_record" {
  fqdn         = local.fqdn
  ip_addr      = var.record_ip
  ttl          = var.ttl
  dns_view     = var.record_dns_view
  network_view = var.network_view
  ext_attrs    = jsonencode(var.ext_attrs)
}
