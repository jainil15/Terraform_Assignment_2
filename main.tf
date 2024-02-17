terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# For assigning region
provider "aws" {
  region = "ap-south-1"
}





