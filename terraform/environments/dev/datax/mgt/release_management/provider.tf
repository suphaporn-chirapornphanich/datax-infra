terraform {
  required_version = ">= 1.4.0"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "43b40993-d0fe-44a6-9e74-f9410e8be26c" # datax-mgmt-prd-01
}
