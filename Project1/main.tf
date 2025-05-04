provider "aws" {
  access_key = "AKIAXZ5NGGUG3PSRN6AR"
  secret_key = "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"
  region     = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket         = "mytfstate1990"
    key            = "terraform/statefile.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    #dynamodb_table = "terraform-locks"
  }
}


resource "aws_s3_bucket_versioning" "mytfstate1990_versioning" {
  bucket = "mytfstate1990"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "mytfstate1990" {
  bucket = "mytfstate1990"

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# resource "aws_s3_bucket_acl" "mytfstate1990_acl" {
#   bucket = "mytfstate1990"
#   acl    = "private"

#   depends_on = [aws_s3_bucket_ownership_controls.mytfstate1990]
# }



  # lifecycle {
  #   prevent_destroy = true 
  # }




module "vpc" {
  source        = "./modules/vpc"
  vpc_cidr      = "10.0.0.0/16"
  vpc_name      = "backend-vpc"
  subnet_cidr   = "10.0.2.0/24"
  subnet_name   = "private-subnet"
  sg_name       = "backend-sg"
  ingress_ports = [22, 80, 443]
}

module "ec2_instance" {
  source          = "./modules/ec2-instance"
  ami             = "ami-03250b0e01c28d196"
  instance_type   = "t2.micro"
  backend_servers = ["server1", "server2"]

  subnet_id = module.vpc.subnet_id
  sg_id     = module.vpc.sg_id
}