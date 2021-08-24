provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-062a21099569f9137"
  instance_type = "t2.micro"
}

