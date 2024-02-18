# OUTPUTS:
output "instance_ip_address" {
  value = aws_instance.public[*].public_ip
}

output "my_ip" {
  value = local.my_public_ip
}

output "s3_name" {
  value = var.s3_name
}
