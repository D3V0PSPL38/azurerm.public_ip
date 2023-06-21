### [BEGIN] outptut.tf ###
output "domain_name_label" {
  description = <<EOD
  [Output] The label for the Domain Name.
  EOD
  value       = join("", azurerm_public_ip.this.*.domain_name_label)
}

output "idle_timeout_in_minutes" {
  description = <<EOD
  [Output] Specifies the timeout for the TCP idle connection.
  EOD
  value       = join("", azurerm_public_ip.this.*.idle_timeout_in_minutes)
}

output "fqdn" {
  description = <<EOD
  [Output] Fully qualified domain name of the A DNS record associated with the public IP. This is the concatenation of the domainNameLabel and the regionalized DNS zone.
  EOD
  value       = join("", azurerm_public_ip.this.*.fqdn)
}

output "ip_address" {
  description = <<EOD
  [Output] The IP address value that was allocated.
  EOD
  value       = join("", azurerm_public_ip.this.*.ip_address)
}

output "ip_version" {
  description = <<EOD
  [Output] The IP version being used, for example IPv4 or IPv6.
  EOD
  value       = join("", azurerm_public_ip.this.*.ip_version)
}

output "public_ip_tags" {
  description = <<EOD
  [Output] A mapping of tags to assigned to the resource.
  EOD
  value       = join("", azurerm_public_ip.this.*.tags)
}
### [END] output.tf ###