resource "aws_vpc" "WebVpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
     tags = {
    Name = var.Vpc_name 
  }
}
  
resource "aws_subnet" "Websubnet" {
    vpc_id=aws_vpc.WebVpc.id
    cidr_block=var.subnet_cidr
     map_public_ip_on_launch = var.map_public_ip
     tags = { 
        Name = var.subnet_name 
        } 
        } 
  

