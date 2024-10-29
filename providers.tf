provider "azurerm" {
  features {
  }
  subscription_id = "add your subscription ID"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}
