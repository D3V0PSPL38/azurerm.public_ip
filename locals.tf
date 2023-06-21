### [BEGIN] locals.tf ###
locals {
  enabled = module.this.enabled
  e       = local.enabled && var.public_ip_count > 0
}
### [END] locals.tf ###