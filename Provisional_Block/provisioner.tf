provider "aws" {
    region = "ap-south-1"
    profile = "configs"
  
}

resource "aws_instance" "my_instance" {
    ami=var.ami_id
    instance_type=var.instance_type
    key_name=var.key_name
    vpc_security_group_ids = var.security_group_ids
    tags = {
      Name = "MyFirstInstance"

    }
    provisioner "file" {
      source = "Hello.txt"
      destination="/home/ubuntu/aws/"
    }
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/serverkp.pem")
    host        = self.public_ip
  }
   provisioner "remote-exec" {
    inline = [

      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}