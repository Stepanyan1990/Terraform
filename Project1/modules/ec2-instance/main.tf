resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.backend_servers)

  tags = {
    Name = var.backend_servers[count.index]
  }
}