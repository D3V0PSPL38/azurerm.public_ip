### [BEGIN] main.tf ###
module "label" {
  source          = "github.com/D3V0PSPL38/terraform-context-label.git"
  enabled         = module.this.enabled
  name            = var.name
  namespace       = var.namespace
  environment     = var.environment
  stage           = var.stage
  location        = var.location
  label_order     = var.label_order
  id_length_limit = var.id_length_limit
  tags            = var.tags
  context         = module.this.context
}

resource "azurerm_public_ip" "this" {
  count                   = local.e ? 1 : 0
  name                    = format("%s-%02d", module.label.id, count.index + 1)
  resource_group_name     = var.resource_group_name
  location                = var.location
  allocation_method       = var.allocation_method
  sku                     = var.sku
  ip_version              = var.ip_version
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  domain_name_label       = var.domain_name_label
  reverse_fqdn            = var.reverse_fqdn
  public_ip_prefix_id     = var.public_ip_prefix_id
  zones                   = var.zones
  timeouts {
    read   = var.timeouts.read
    create = var.timeouts.create
    update = var.timeouts.update
    delete = var.timeouts.delete
  }
  tags = module.label.tags
}
### [END] main.tf ###