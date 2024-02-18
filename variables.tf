variable "env" {
  type = string
}

variable "s3_name" {
  default = "jainils-s3-bucket-unique-1"
  type    = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
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
