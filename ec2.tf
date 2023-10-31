provider "aws" {
  region = "ap-south-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"  
  subnet_id     = data.aws_subnet.default.id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
