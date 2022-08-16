
resource "aws_instance" "gaming" {
  ami               = data.aws_ami.windows_2022.id
  availability_zone = "${var.region}a"
  # instance_type = "g4dn.xlarge"
  instance_type               = "t3.2xlarge"
  associate_public_ip_address = true
  ebs_optimized               = true
  root_block_device {
    volume_size = "512"
    volume_type = "io1"
    iops        = "100"
  }
  vpc_security_group_ids = [aws_security_group.gaming.id]

  subnet_id = aws_subnet.gaming.id

  tags = {
    Name = "gaming"
  }
}

resource "aws_volume_attachment" "storage" {
  device_name = "/dev/nvme0n1"

  volume_id   = aws_ebs_volume.storage.id
  instance_id = aws_instance.gaming.id

}

output "ip_address" {
  value = aws_instance.gaming.public_ip
}
output "public_dns" {
  value = aws_instance.gaming.public_dns
}

