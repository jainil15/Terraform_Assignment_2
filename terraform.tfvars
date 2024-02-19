env                        = "test"
s3_name                    = "jainil-s3-unique-bucket"
ami_id                     = "ami-06b72b3b2a773be2b"
instance_type              = "t2.micro"
vpc_cidr_block             = "138.82.0.0/16"
azs                        = ["ap-south-1a", "ap-south-1b"]
private_subnet_cidr_blocks = ["138.82.0.64/26", "138.82.0.128/26"]
public_subnet_cidr_blocks  = ["138.82.2.64/26", "138.82.2.128/26"]
private_subnet_tags = {
  Description = "private-subnet"
}
public_subnet_tags = {
  Description = "public-subnet"
}
