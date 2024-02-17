# Creating public key from the private key which was created before
data "tls_public_key" "mykeypair" {
  private_key_openssh = file("./mykeypair.pem")
}


# Creating key pair for ssh access
resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = data.tls_public_key.mykeypair.public_key_openssh # Getting public key from private key
}
