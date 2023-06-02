


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


resource "null_resource" "null_resource_simple" {
  triggers = {
    id = aws_instance.ec2_example.id  
  }
  provisioner "local-exec" {
    command = <<-EOT
      chmod +x install-istio.sh  
      ./install-istio.sh
    EOT
  }
}
