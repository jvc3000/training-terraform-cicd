terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }
  }
  backend "s3" {
    bucket = "vince-boa-terraform-state"
    key = "dev/vince/terraform.tfstate"
    encrypt = true
    region = "us-east-1"
    dynamodb_table = "vince-lock-table"
  }
}

provider "aws" {
  # Configuration options
  region = var.my_asw_region
}