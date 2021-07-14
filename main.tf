# ----------------------
#  PROVIDER
# ----------------------
provider "infoblox" {
  sslmode = var.ssl_mode
}

resource "infoblox_a_record" "a_record" {
  count     = var.enabled ? 1 : 0
  vm_name   = var.record_hostname
  cidr      = "${var.record_ip}/32"
  ip_addr   = var.record_ip //use the ip address used in IP allocation
  dns_view  = var.record_dns_view
  zone      = var.record_domain
  tenant_id = var.record_hostname
}
