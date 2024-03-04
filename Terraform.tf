terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version =">1.6.0"
    }
  }
}


resource "aws_vpc" "slim"{
    cidr_block = "192.168.10.0/21"
    tags = {
      Name = "network"
      Env = "deployment"
      Createdby = "Gopi"
    }
}

resource "aws_subnet" "data" {
    cidr_block = "192.168.10.0/24"
    vpc_id = aws_vpc.slim.id
    tags = {
        Name = "chatboot"
    }
}

resource "aws_security_group" "web" {
    description = "web security group"
    name = "web"
    vpc_id = aws_vpc.slim.id
  
}


