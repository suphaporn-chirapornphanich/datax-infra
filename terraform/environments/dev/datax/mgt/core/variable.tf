variable "tags" {
  default     = {}
  description = "(Required) tag map to assign to the provisioned resources"
  type        = map(string)
}

variable "common_tags" {
  description = "The common tag map to assign to all resources"
  type        = map(any)
}

####### naming convention variable ######
variable "environment" {
  description = "(Required) environment"
  type        = string
}

variable "project_name" {
  description = "(Required) project name"
  type        = string
}

variable "service_name" {
  description = "(Required) service name"
  type        = string
}

variable "location" {
  description = "(Required) Azure region where the Virtual Network is created"
  type        = string
}

variable "subsidiary" {
  description = "(Required) subsidiary"
  type        = string
}

variable "other_suffix" {
  description = "other_suffix"
  type        = string
  default     = ""
}
