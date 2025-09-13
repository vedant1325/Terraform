module "ec2"{

source="/home/vedant/Terraform/Modules/resources/ec2"
This_ami="ami-0c4a668b99e68bbde"
instance_type="t3.micro"
keypair="serverkp"
subnetId=module.aws_vpc.subnet_id
scg=["sg-0b203e32efe6caf31"]
az="ap-south-1a"
vpc_id=module.aws_vpc.vpc_id
}

module "aws_vpc"{
source="/home/vedant/Terraform/Modules/resources/vpc"
vpc_cidr="192.168.0.0/16"
Vpc_name="My_VPC"
subnet_cidr="192.168.0.0/17"
map_public_ip=true
subnet_name="My_Subnet"
}