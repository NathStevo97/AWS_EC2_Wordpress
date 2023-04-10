terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.52.0"
    }
    template = {
      source = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  profile = "Nathan-Dev"
  region  = "eu-west-2"
}

provider "template" {
  # Configuration options
}