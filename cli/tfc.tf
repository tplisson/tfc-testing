terraform {
  cloud {
    organization = "ccs-testing"
    workspaces {
      name = "tfc-testing"
    }
  }
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 3.37.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
# }