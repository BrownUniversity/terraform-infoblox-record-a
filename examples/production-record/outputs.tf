output "record_ip" {
  description = "Static IP for the a-record"
  value       = local.record_ip
}

output "record_fqdn" {
  description = "FQDN of the a-record"
  value       = "${local.record_hostname}.${local.record_domain}"
}
