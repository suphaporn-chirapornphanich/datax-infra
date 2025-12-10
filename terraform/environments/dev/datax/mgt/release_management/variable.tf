variable "rg_name" {
  type = string
}

variable "storage_suffix" {
  type = string
}

variable "subsidiary" {
  description = "subsidiary"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

variable "project_name" {
  description = "project name"
  type        = string
}

variable "service_name" {
  description = "service name"
  type        = string
}

variable "location" {
  type    = string
  default = "southeastasia"
}

variable "tags" {
  type        = map(string)
  description = "tags"
  default     = {}
}

variable "common_tags" {
  description = "The common tag map to assign to all resources"
  type        = map(any)
}
