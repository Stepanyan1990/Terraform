output "vpc_id" {
  value = aws_vpc.backend_vpc.id
}

output "subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "sg_id" {
  value = aws_security_group.backend_sg.id
}
