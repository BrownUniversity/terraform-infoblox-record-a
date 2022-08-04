output "id" {
  description = "ID of provisioned infoblox resource"
  value = module.production_infoblox_record.id
}

output "fqdn" {
  description = "The fully-qualified domain name of the A record created"
  value = module.production_infoblox_record.fqdn
}

output "ip_address" {
  description = "The IP address associated with the A record"
  value = module.production_infoblox_record.ip_address
}

output "extended_attributes" {
  description = "The EAs created for the object"
  value = module.production_infoblox_record.extended_attributes
}