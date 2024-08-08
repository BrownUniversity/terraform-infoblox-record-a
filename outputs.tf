output "id" {
  description = "ID of provisioned infoblox resource"
  value       = infoblox_a_record.a_record.id
}

output "fqdn" {
  description = "The fully-qualified domain name of the A record created"
  value       = infoblox_a_record.a_record.fqdn
}

output "ip_address" {
  description = "The IP address associated with the A record"
  value       = infoblox_a_record.a_record.ip_addr
}

output "extended_attributes" {
  description = "The EAs created for the object"
  value       = infoblox_a_record.a_record.ext_attrs
}

output "network_view" {
  value = infoblox_a_record.a_record.dns_view
}