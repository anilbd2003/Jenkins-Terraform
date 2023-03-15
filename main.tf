terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  profile = "custom"
  }


resource "aws_instance" "ec2_example" {
    ami = "ami-0557a15b87f6559cf"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2_instance"
    }
}

