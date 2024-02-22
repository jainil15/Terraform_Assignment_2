terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Creating s3 backend for storing tfstate file
  backend "s3" {
    bucket  = "jainil-terraform-assignment-2-backend"
    region  = "ap-south-1"
    encrypt = true
    profile = "terra-user"
    assume_role = {
      role_arn = "arn:aws:iam::171358186705:role/terraform"
    }

    dynamodb_table = "jainil-terraform-lock-table"
    key            = "assignment-2/test/terraform.tfstate"
  }
}

locals {
  env = "ass-2-test"
}

# For assigning region
provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source                     = "../modules/vpc"
  env                        = local.env
  azs                        = ["ap-south-1a"]
  vpc_cidr_block             = "78.23.0.0/16"
  private_subnet_cidr_blocks = ["78.23.0.64/26"]
  public_subnet_cidr_blocks  = ["78.23.2.64/26"]
  private_subnet_tags        = {}
  public_subnet_tags         = {}
}

module "s3" {
  source  = "../modules/s3"
  env     = local.env
  s3_name = "jainils-unique-s3-bucket-3" // globally unique name
}

module "instances" {
  source             = "../modules/instances"
  env                = local.env
  ami_id             = "ami-06b72b3b2a773be2b"
  instance_type      = "t2.micro"
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  vpc_id             = module.vpc.vpc_id
  s3_id              = module.s3.s3_ver_id
  public_sg_ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["120.42.44.12/32"]
    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

}

