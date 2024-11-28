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