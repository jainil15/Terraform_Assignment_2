env                        = "Prod"
s3_name                    = "jainil-unique-bucket-1"
ami_id                     = "ami-06b72b3b2a773be2b"
instance_type              = "t2.micro"
vpc_cidr_block             = "124.22.0.0/16"
azs                        = ["ap-south-1a", "ap-south-1b"]
private_subnet_cidr_blocks = ["124.22.0.64/26", "124.22.0.128/26"]
public_subnet_cidr_blocks  = ["124.22.2.64/26", "124.22.2.128/26"]
public_subnet_tags = {
  Description = "This is a public subnet connected to internet gateway"
}
private_subnet_tags = {
  Description = "This is a private subnet not connected to the internet gateway"
}