resource "aws_ebs_volume" "storage" {
  availability_zone = "${var.region}a"
  size              = 40
  tags = {
    Name = "gaming"
  }
}