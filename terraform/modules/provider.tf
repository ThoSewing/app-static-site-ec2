# PROVIDER
terraform {

  required_version = "~> 1.5"

  backend "s3" {
    bucket         = "tf-static-state-thomas-fernandes"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-static-state-thomas-fernandes"
    region         = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

# provider "aws" {
#   region                   = "us-east-1"
#   shared_config_files      = ["./.aws/config"]
#   shared_credentials_files = ["./.aws/credentials"]
#   profile                  = "fiap"
# }