variable "rg_id" {
  type        = string
  description = "Resource group id"
}

variable "search_service_name" {
  type        = string
  description = "Name of the search service"
}

variable "location" {
  type        = string
  description = "Location of the search service. Defaults to resource group location."
}

variable "ip_rules" {
  type        = list(string)
  description = "List of ip rules"
  default     = []
}

variable "pe_subnets" {
  type        = list(string)
  description = "List of subnets to create private endpoints for"
}

variable "sku" {
  type        = string
  description = "The SKU of the search service"
  default     = "basic"
}

variable "public_network_access" {
  type        = string
  description = "Whether or not the search service should be accessible from public networks. This variable is ignored if pe_subnets is not empty."
  default     = "Disabled"
}

variable "network_rule_set_bypass" {
  type        = string
  description = "Bypass options for network rule set. Valid values are 'AzurePortal', 'AzureServices' and 'None'."
  default     = "AzurePortal"
}

variable "lifecycle_ignore_tag_changes" {
  type        = bool
  description = "Whether or not to ignore tag changes in the lifecycle block"
  default     = false
}