# PROVIDER
terraform {

  required_version = "~> 1.5"

  backend "s3" {
    bucket         = "tf-static-state-thomas-fernandes"
    key            = "dev/terraform.tfstate"
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

provider "aws" {
  region = "us-east-1"
}