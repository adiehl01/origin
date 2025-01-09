provider "aws" {
#  region = "us-east-2"
  region = "us-east-1"
}

resource "aws_instance" "example" {
#  ami           = "ami-0fb653ca2d3203ac1"
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  tags = {
      Name = "terraform-example"
  }
}
