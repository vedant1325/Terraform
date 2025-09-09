provider "aws"{
    region="ap-south-1"
    profile="configs"
}

resource "aws_instance" "example" {
    ami = "ami-0c4a668b99e68bbde"
    instance_type = "t2.micro"
    key_name = "serverkp"
    vpc_security_group_ids = ["sg-01e29a8691de24a5f"]
     tags = {
    Name = "MyExampleInstance"
  }
  
}

