terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "chenal"
  region  = "eu-west-1"
}


data "template_file" "user_data" {
  template = file("cloud-init.yml")
}


resource "aws_instance" "matkonim_server" {
  ami           = "ami-08edbb0e85d6a0a07"
  instance_type = "t2.micro"
  user_data     = data.template_file.user_data.rendered

  tags = {
    Name        = var.instance_name
    owner       = "chenal"
    provisioned = "terraform"
    usage       = "learn terraform"
    deleteme    = "true"
  }
}
