resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "gaming_rig"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { #
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./gaming_rig_private_key.pem"
  }
}