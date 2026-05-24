resource "aws_key_pair" "my_key" {
  key_name   = "ec2-key"
  public_key = file("ec2.pub")
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_sg" {
  name        = "automate-sg"
  description = "This is for access"
  vpc_id      = aws_default_vpc.default.id

  # Ingress Rules
  ingress {
    from_port   = 22
    to_port     = 22
    description = "ssh access"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    description = "http access"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress Rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysg"
  }
}

resource "aws_instance" "my_ec2" {
  for_each  = tomap ({
    PMIS_dev = "t2.micro"
    PMIS_stage = "t2.medium"
    PMIS_prod = "t2.large"
  })
  ami           = var.ami
  instance_type = each.value
  key_name      = aws_key_pair.my_key.key_name
  user_data = file("install-apache.sh")

  # Use vpc_security_group_ids instead of security_groups
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
  }
}