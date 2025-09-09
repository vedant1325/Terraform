provider "aws" {
  region = "ap-south-1"
  profile = "configs"
}

# Create S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-vedant-2025"  # Change this to a globally unique name

  tags = {
    Name = "MyExampleBucket"
  }
}

# Upload a File to the S3 Bucket
resource "aws_s3_bucket_object" "my_file" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "./example.txt"
  source = "example.txt"  # Path to your local file
}
