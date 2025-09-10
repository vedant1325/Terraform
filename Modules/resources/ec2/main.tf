resource "aws_instance" "MyWebServer" {
    ami =var.This_ami
    availability_zone = var.az
    instance_type = var.instance_type
    tags = {
        Name = "Webserver"
    } 
    vpc_security_group_ids = var.scg
    key_name = var.keypair
    subnet_id = var.subnetId
      
}