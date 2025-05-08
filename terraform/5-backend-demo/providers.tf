terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

// Setup a remote backend in AWS S3
 backend "s3" {
    bucket         = "lcs-terraform-backend-demo"
    key            = "state.tfstate"
    region         = "ap-southeast-1" // this is bucket region, can be different from the region in provider block
 }
}

provider "aws" {
  region = "ap-southeast-1" // this is the region where infrastructure will be deployed
}