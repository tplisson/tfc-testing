terraform {
  cloud {
    organization = "tplisson"
    workspaces {
      name = "tfc-testing"
    }
  }
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 3.36.0"
    }
  }
}