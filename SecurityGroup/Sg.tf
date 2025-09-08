provider "aws"{
    region = "ap-south-1"
    profile = "default"
}

resource "aws_instance" "MyInstance" {
     ami = "ami-0c4a668b99e68bbde"
    instance_type = "t2.micro"
    key_name = "serverkp"
    vpc_security_group_ids = ["sg-01e29a8691de24a5f","aws_security-group.my_sg.id"]
     tags = {
    Name = "MyExampleInstance"
     }
}

resource "aws_security_group" "my_sg" {
     name        = "my-security-group"
     description = "Allow SSH and HTTP and 8080"

      # Inbound rules

     ingress {
        description = "SSH from my IP"
         from_port   = 22
         to_port     = 22
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"] # Be careful, this allows SSH from anywhere

  
}
ingress {
        description = "HTTP from anywhere"
         from_port   = 80
         to_port     = 80
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
}
ingress {
        description = "HTTP from anywhere"
         from_port   = 8080
         to_port     = 8080
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
}

#Outbound rule
 egress{
    from_port =0
    to_port=0
    protocol="-1" # All protocols
    cidr_blocks=["0.0.0.0/0"]
 }
  tags = {
    Name = "my-security-group-terraform"
  }
}