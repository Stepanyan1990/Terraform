resource "aws_vpc" "backend_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.backend_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "backend_sg" {
  name   = var.sg_name
  vpc_id = aws_vpc.backend_vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  
    }
  }
}

