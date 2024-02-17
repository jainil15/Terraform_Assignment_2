# Accessing ipv4.icanhazip/json for accessing my ip address
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com/json"
  request_headers = {
    Accept = "application/json"
  }
}


# Local Variables
locals {
  server_name = "Jainils_Server"
  vpc_name    = "Jainils_VPC"
  # Getting my_ip from the json data
  my_public_ip = chomp(data.http.my_public_ip.response_body)
}
