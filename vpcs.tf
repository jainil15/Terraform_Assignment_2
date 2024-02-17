# Creating VPC
resource "aws_vpc" "app_vpc" {
  cidr_block       = "138.82.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "${local.vpc_name}"
  }
}

# Creating subnet
resource "aws_subnet" "public_ap_south_1a" {
  vpc_id            = aws_vpc.app_vpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = "138.82.0.64/26"
  depends_on        = [aws_vpc.app_vpc]
  tags = {
    Name = "Public_Subnet_1"
  }
}

# Creating internet gateway
resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = "Jainils_IGW"
  }
}

# Creating route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }
  tags = {
    Name = "Public_Route_Table_1"
  }
}

# Associating subnet with route table
resource "aws_route_table_association" "subnet_association_public_subnet_ap_south_1a" {
  subnet_id      = aws_subnet.public_ap_south_1a.id
  route_table_id = aws_route_table.public.id
}
