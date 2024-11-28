variable "cognitive_account_id" {
  type        = string
  description = "ID of the parent cognitive account"
}

variable "cognitive_deployment_name" {
  type        = string
  description = "Name of the cognitive deployment"
}

variable "sku" {
  type        = string
  description = "The SKU of the cognitive deployment"
  default     = "Standard"
}

variable "model_format" {
  type        = string
  description = "The format of the model"
  default     = "OpenAI"
}

variable "model_name" {
  type        = string
  description = "The name of the model"
}

variable "model_version" {
  type        = string
  description = "The version of the model"
}