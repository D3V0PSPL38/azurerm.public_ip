### [BEGIN] variables.tf ###
variable "public_ip_count" {
  description = "Number of public IP addresses to create"
  type        = number
  default     = 0
}

variable "resource_group_name" {
  description = <<EOD
  [Optional] The name of an existing resource group in which to provision the virtual network. If ommitted, a new resource group will be created.
  EOD
  type        = string
  default     = null
}

variable "allocation_method" {
  description = <<EOD
  [Optional] Defines the allocation method for this IP address. Possible values are Static or Dynamic. Changing this forces a new resource to be created.
  EOD
  type        = string
  default     = "Dynamic"
}

variable "sku" {
  description = <<EOD
  [Optional] The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic
  EOD
  type        = string
  default     = "Basic"
}

variable "ip_version" {
  description = <<EOD
  [Optional] The IP Version to use, IPv6 or IPv4.
  EOD
  type        = string
  default     = "IPv4"
}

variable "idle_timeout_in_minutes" {
  description = <<EOD
  [Optional] Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes
  EOD
  type        = string
  default     = "4"
}

variable "domain_name_label" {
  description = <<EOD
  [Optional] Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system.
  EOD
  type        = string
  default     = null
}

variable "reverse_fqdn" {
  description = <<EOD
  [Optional] A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN.
  EOD
  type        = string
  default     = null
}

variable "public_ip_prefix_id" {
  description = <<EOD
  [Optional] If specified then public IP address allocated will be provided from the public IP prefix resource.
  EOD
  type        = string
  default     = null
}

variable "zones" {
  description = <<EOD
  [Optional] A collection containing the availability zone to allocate the Public IP in
  EOD
  type        = list(string)
  default     = []
}

variable "timeouts" {
  description = <<EOD
  [Optional] The timeouts block allows you to specify timeouts for certain actions
  EOD
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = {
    create = "30m"
    read   = "30m"
    update = "30m"
    delete = "30m"
  }
}
### [END] variables.tf ###