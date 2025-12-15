provider "aws"{
region="ap-south-1"
profile="config"
}

resources "aws_instance" "my_server"{
for_each=toset(var.imageid)
ami=each.value
instance_type=t2.micro
key_pair="serverkp"
tags={
name="My_server"
}
}

variable "imageid"{
default = ["ami-05f991c49d264708f", "ami-0987e9d53da324257"]

}
