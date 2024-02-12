provider "aws" {
  region = "ap-south-1" # Set your desired AWS region
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "THis is the instance Type"
}

variable "ami_id" {
  type        = string
  description = "This is the ami id"
}


resource "aws_instance" "ec2_01" {
  #ami           = "ami-0d92749d46e71c34c" # Specify an appropriate AMI ID
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id     = "subnet-0f6ac7881fc90d49b"
  tags = {
    name = "EC2-01"
  }

}

output "public_ip" {
  value       = aws_instance.ec2_01.private_ip
  description = "Printing Public IP"

}