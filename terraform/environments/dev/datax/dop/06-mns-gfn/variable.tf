variable "grafana_url" {
  description = "Grafana URL"
  type        = string
}

variable "grafana_auth" {
  description = "Grafana API authentication token"
  type        = string
  sensitive   = true
}

variable "prometheus_datasource" {
  description = "Prometheus datasource ID"
  type        = string
}

variable "infinity_datasource" {
  description = "Infinity datasource ID"
  type        = string
}

variable "databricks_datasource" {
  description = "Databricks datasource ID"
  type        = string
}

variable "databricks_dashborad" {
  description = "Databricks dashboard configuration"
  type = map(object({
    tables = map(string)
    dashboards = list(object({
      title          = string
      dashboard_type = string
    }))
  }))
  validation {
    error_message = "dashboard_type in dashboards cannot be duplicated"
    condition = alltrue([
      for key, value in var.databricks_dashborad : length(value.dashboards) == length(distinct([for dashboard in value.dashboards : dashboard.dashboard_type]))
    ])
  }
}
