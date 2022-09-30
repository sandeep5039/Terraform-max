terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.95.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myrg" {
  name     = "${var.prefix}-${var.env}-RG"
  location = "eastus"
  tags = {
    name = "${var.prefix}-${var.env}-RG"
    environment = var.env
    costcenter = "IT"
  }
}

