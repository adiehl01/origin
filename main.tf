provider "aws" {
#  region = "us-east-2"
  region = "us-east-1"
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
# Amazon Image         ami               = "ami-0fb653ca2d3203ac1"
# Book recommendation  ami           	 = "ami-01816d07b1128cd2d"
  ami                    = "ami-005fc0f236362e99f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}

