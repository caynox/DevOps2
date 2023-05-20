provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-north-1"
}

resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.aws_availability_zone
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example Security Group"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "prometheus_server" {
  ami                    = "ami-0a79730daaf45078a"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.example.id
  vpc_security_group_ids = [aws_security_group.example.id]
  key_name               = "PavYar"

  user_data = <<-EOF
    #!/bin/bash
    # Команди для встановлення Prometheus Stack, Node Exporter та Cadvizor Exporter
    # ...
    EOF

  tags = {
    Name = "prometheus-server"
  }
}

resource "aws_instance" "second_server" {
  ami                    = "ami-0a79730daaf45078a"
  instance_type          = "t3.micro"
  key_name               = "PavYar"

  tags = {
    Name = "SecondServer"
  }
}




