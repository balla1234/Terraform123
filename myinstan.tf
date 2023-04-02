#variable
variable "access_key" {}
variable "secret_key" {}
variable "myregion" {}
   

#Provider
  provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.myregion}"
  }

#Resources
  resource "aws_instance" "myserver" {
    ami = "ami-071c33e7823c066b5"
    instance_type = "t2.micro"
    key_name = "latest"

  }

    

#Output