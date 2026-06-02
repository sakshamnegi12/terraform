resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-${var.key_name}"
  public_key = file("ec2new.pub")
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_sg" {
  name        = "${var.env}-${var.sg_name}"
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
    Name = "${var.env}-${var.sg_name}"
  }
}

resource "aws_instance" "my_ec2" {

  count = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key.key_name

  # Use vpc_security_group_ids instead of security_groups
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-${var.instance_name}" 
  }
}