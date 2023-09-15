terraform {
  required_providers {
    aws = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}