terraform {
  required_version = ">= 1.4.0"
  backend "azurerm" {}
  required_providers {
    grafana = {
      source = "grafana/grafana"
    }
  }
}

provider "grafana" {
  url                  = var.grafana_url
  auth                 = var.grafana_auth
  insecure_skip_verify = true
}
