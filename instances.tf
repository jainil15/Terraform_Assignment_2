# Creating aws ec2 instance with web server
resource "aws_instance" "app_server" {
  ami                         = "ami-06b72b3b2a773be2b"
  key_name                    = aws_key_pair.mykeypair.key_name
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_ap_south_1a.id
  vpc_security_group_ids      = [aws_security_group.allow_http_and_ssh.id]
  associate_public_ip_address = true
  tags = {
    Name = "${local.server_name}"
  }
  user_data  = <<EOF
#!bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>HELLO WORLD FROM $(hostname -f)</h1>" > /var/www/html/index.html
systemctl restart httpd
  EOF
  depends_on = [aws_s3_bucket.jainils_223]
}
