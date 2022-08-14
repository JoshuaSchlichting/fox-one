resource "aws_ebs_volume" "storage" {
  availability_zone = var.region
  size              = 40

  tags = {
    Name = "gaming"
  }
}