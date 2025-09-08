provider "aws" {
  region = "ap-south-1"
  profile = "configs"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123456"
  acl  = "private"
  

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
