resource "aws_vpc" "gaming" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_classiclink_dns_support = true
  tags = {
    Name = "gaming"
  }
}

resource "aws_subnet" "gaming" {
  vpc_id            = aws_vpc.gaming.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "gaming"
  }
}

resource "aws_security_group" "gaming" {
  name        = "gaming-sg"
  description = "gaming"
  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"
    self      = true
  }
  ingress {
    description = "RDP UDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "udp"
    self        = true
  }
  ingress {
    from_port = 48010
    to_port   = 48010
    protocol  = "udp"
    self      = true
  }
  ingress {
    from_port = 48010
    to_port   = 48010
    protocol  = "tcp"
    self      = true
  }
  ingress {
    from_port = 47989
    to_port   = 47989
    protocol  = "tcp"
    self      = true
  }
  ingress {
    from_port = 47984
    to_port   = 47984
    protocol  = "tcp"
    self      = true
  }
  ingress {
    from_port = 47998
    to_port   = 48000
    protocol  = "udp"
    self      = true
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  vpc_id = aws_vpc.gaming.id
}