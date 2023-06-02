


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


# This null_resource will be executed everytime because of id = time().
resource "null_resource" "null_resource_simple" {
  
  # Look carefully in the trigger we have assigned time() which we change value every time you run $terraform apply command.
  triggers = {
    id = time()
  }

  provisioner "local-exec" {
    command = "echo Hello World"
  }
} 
