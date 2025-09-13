provider "aws" {
      region = "ap-south-1"
      profile = "configs"
      shared_credentials_files = ["/home/vedant/.aws/credentials"]
    
}

#Partitionkey = LockId
terraform {
    backend "s3" {
        bucket = "tfvedbucket"
        key = "terraform.tfstate"
        dynamodb_table = "veda2003"
        region = "ap-south-1"
        profile = "configs"
        shared_credentials_files = ["/home/vedant/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = var.this_aws_ami
  //key_name = ""
  instance_type = var.this_aws_instance_instance_type
  count = var.this_aws_instance_count
  
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo echo "hello world this is Batc24" >> /var/www/html/index.html
    EOF
   tags = {
    Name = "first_terraform_instance"

  } 
    
}