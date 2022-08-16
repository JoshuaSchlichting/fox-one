
resource "aws_security_group" "gaming" {
  name        = "gaming-sg"
  description = "gaming"
  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"
    self      = true
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "Moonlight"
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
}