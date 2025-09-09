provider "aws"{
    region="ap-south-1"
    profile="configs"
}

data "aws_security_group" "example" {
  tags={
    name="newGrp"
  }
}
data "aws_subnet" "sb"{
    tags={
        Name="subnet1"
    }
}

resource "aws_instance" "example" {
    ami = "ami-0c4a668b99e68bbde"
    instance_type = "t2.micro"

    subnet_id = data.aws_subnet.sb.id
    key_name = "serverkp"
    vpc_security_group_ids = [data.aws_security_group.example.id]
     tags = {
    Name = "MyExampleInstance"
  }
  
}




data "aws_security_group" "ex"{
    tags={
        name="mywebgroup"
    }
}

output "sg_id" {
    value = data.aws_security_group.ex.id
}

#Avalability zones
data "aws_availability_zones" "names" {
  state = "available"
}
output "available_zone" {
  value = data.aws_availability_zones.names
}

