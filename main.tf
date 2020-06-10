# ----------------------
#  PROVIDER
# ----------------------
provider "infoblox" {
  version  = "v1.0.0"
  username = var.infoblox_username
  server   = var.infoblox_host
  password = var.infoblox_password
  sslmode  = var.sslmode
}

resource "infoblox_a_record" "a_record" {
  network_view_name = var.record_dns_view
  vm_name           = var.record_hostname
  cidr              = "${var.record_ip}/32"
  ip_addr           = var.record_ip //use the ip address used in IP allocation
  dns_view          = var.record_dns_view
  zone              = var.record_domain
  tenant_id         = var.record_hostname
}
