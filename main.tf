# Terraform Block

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }        
  }
  cloud {
    organization = "my-org"
    workspaces {
      tags = ["networking"]
    }
  }
}


# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0767046d1677be5a0"
  instance_type =  "t2.micro"
  tags = {
    Name = "Terraform EC2 "
  }
}

# The following null resource will print message "Hello World"
resource "null_resource" "null_resource_simple" {
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}
