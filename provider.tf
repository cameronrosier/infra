terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us_east_1"
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Application = "robopd2"
    }
  }
}