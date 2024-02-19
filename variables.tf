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
  type        = string
  description = "VPC's cidr block"
}

variable "azs" {
  type        = list(string)
  description = "List of Availibility zones"
}

variable "private_subnet_cidr_blocks" {
  default     = []
  type        = list(string)
  description = "List of private subnets cidr block"
}


variable "public_subnet_cidr_blocks" {
  default     = []
  type        = list(string)
  description = "List of public subnets cidr block"
}

variable "public_subnet_tags" {
  type        = map(any)
  description = "Public subnet tags"
}

variable "private_subnet_tags" {
  type        = map(any)
  description = "Private subnet tags"
}
