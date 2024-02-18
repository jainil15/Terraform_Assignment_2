# Accessing ipv4.icanhazip/json for accessing my ip address
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com/json"
  request_headers = {
    Accept = "application/json"
  }
}


# Local Variables
locals {
  # Getting my_ip from the json data
  my_public_ip = chomp(data.http.my_public_ip.response_body)
}
