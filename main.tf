


# Provider Block
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "ec2_example" {
  ami           = "admin-terraform-aws"
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
