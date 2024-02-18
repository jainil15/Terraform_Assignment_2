
# Creating security group for http and ssh access and all outbound access
resource "aws_security_group" "public" {
  name        = "${var.env}-public-sg"
  description = "This security groups allows http inbound traffic from all sources and ssh from my ip"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "tcp"
    from_port        = 80
    to_port          = 80
  }
  ingress {
    cidr_blocks = ["${local.my_public_ip}/32"] # Only MY IP Access
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
  }
}

resource "aws_security_group" "private" {
  name        = "allow_http_and_ssh"
  description = "Only ssh for now"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    cidr_blocks = ["${local.my_public_ip}/32"] # Only MY IP Access
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
  }
}

