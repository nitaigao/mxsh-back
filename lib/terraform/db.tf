provider "aws" {
  region     = "ap-southeast-1"
}

resource "aws_db_instance" "mxsh" {  
  allocated_storage        = 5
  engine                   = "postgres"
  engine_version           = "9.5.4"
  db_subnet_group_name     = "dc"
  identifier               = "mxsh"
  instance_class           = "db.t2.micro"
  multi_az                 = false
  name                     = "mxsh_production"
  password                 = "${trimspace(file("${path.module}/../../.secrets/mxsh-password.txt"))}"
  publicly_accessible      = false
  username                 = "mxsh"
  vpc_security_group_ids   = ["sg-2d59fe4a"]
}

resource "aws_db_subnet_group" "dc" {
    name = "dc"
    subnet_ids = ["subnet-83592ae7", "subnet-84c3a5f2"]
    tags {
        Name = "Docker Cloud"
    }
}