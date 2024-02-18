# OUTPUTS:
output "instance_ip_address" {
  value = aws_instance.app_server.public_ip
}

output "my_ip" {
  value = local.my_public_ip
}

output "s3_name" {
  value = var.s3_name
}
