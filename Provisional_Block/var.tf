variable "ami_id" {
  default = "ami-0c4a668b99e68bbde"
}
variable "instance_type" {
  default = "t2.micro"
  
}
variable "key_name" {
    default = "serverkp"
  
}
variable "security_group_ids" {
  default=["sg-01e29a8691de24a5f"]
}