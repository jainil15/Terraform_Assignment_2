# Accessing ifconfig.com for accessing my ip address
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com/json"
  request_headers = {
    Accept = "application/json"
  }
}


# Creating security group for http and ssh access and all outbound access
resource "aws_security_group" "allow_http_and_ssh" {
  name        = "allow_http_and_ssh"
  description = "This security groups allows http and ssh inbound traffic from all sources"
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
