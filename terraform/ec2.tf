
resource "aws_instance" "gaming_rig" {
  ami           = data.aws_ami.windows_2022.id
  instance_type = "g4dn.xlarge"
  ebs_optimized = true
  root_block_device {
    volume_size = "512"
    volume_type = "io1"
    iops        = "100"
  }
  security_groups = []
  tags = {
    Name = "gaming"
  }
}



resource "aws_volume_attachment" "storage" {
  device_name = "/dev/nvme0n1"
  volume_type = "NVMe"
  volume_size = "100"
  volume_id   = aws_ebs_volume.storage.id
  instance_id = aws_instance.gaming_rig.id

}

resource "aws_security_group" "gaming_rig" {
  name        = "gaming"
  description = "gaming"
  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
  }
  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "udp"
  }
  ingress {
    description = "custom rule"
    from_port   = 48010
    to_port     = 48010
    protocol    = "udp"
  }
  ingress {
    description = "custom rule"
    from_port   = 48010
    to_port     = 48010
    protocol    = "tcp"
  }
  ingress {
    description = "custom rule"
    from_port   = 47989
    to_port     = 47989
    protocol    = "tcp"
  }
  ingress {
    description = "custom rule"
    from_port   = 47984
    to_port     = 47984
    protocol    = "tcp"
  }
  ingress {
    description = "custom rule"
    from_port   = 47998
    to_port     = 48000
    protocol    = "udp"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  #   vpc_id      = aws_vpc.gaming_rig.id
}