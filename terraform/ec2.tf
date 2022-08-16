
resource "aws_instance" "gaming" {
  ami               = data.aws_ami.windows_2022.id
  availability_zone = "${var.region}a"
  # instance_type = "g4dn.xlarge"
  instance_type               = "t3.2xlarge"
  associate_public_ip_address = true
  ebs_optimized               = true
  key_name = aws_key_pair.gaming.key_name
  root_block_device {
    volume_size = "512"
    volume_type = "io1"
    iops        = "100"
  }
  security_groups = [aws_security_group.gaming.name]

  tags = {
    Name = "gaming"
  }
}

output "ip_address" {
  value = aws_instance.gaming.public_ip
}
output "public_dns" {
  value = aws_instance.gaming.public_dns
}

