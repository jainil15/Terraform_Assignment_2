variable "env" {
  type        = string
  description = "Name of the environment"
}

variable "s3_name" {
  default     = "jainils-s3-bucket-unique-1"
  type        = string
  description = "S3 bucket's unique name"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type of instance"
}

variable "vpc_cidr_block" {
  type = string
}

variable "private_subnet_cidr_blocks" {
  default = []
  type    = list(string)
}


variable "public_subnet_cidr_blocks" {
  default = []
  type    = list(string)
}

variable "public_subnet_tags" {
  type = map(any)
}

variable "private_subnet_tags" {
  type = map(any)
}

variable "azs" {
  type = list(string)
}
