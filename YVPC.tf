provider "aws" {
  region = us-east-1
}

#Creating VPC, name, CIDR and Tags
resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"

  tags = {
    Name = "myvpc"
  }
}

#Creating Public Subnets in VPC
resource "aws_subnet" "mypublicsubnet" {
  vpc_id     = aws_vpc.mypublicsubnet.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "mypublicsubnet"
  }
}

#Creating internet gateway in AWS VPC

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myigw.id

  tags = {
    Name = "myigw"
  }


#Creating Route Table for Internet gateway

resource "aws_route_table" "mypublicRT" {
  vpc_id = aws_vpc.mypublicRT.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.mypublicRT.id
  }


  tags = {
    Name = "mypublicRT"
  }
}

#creating route  assossication public subnet 
resource "aws_route_table_association" "mypublicsubnetass" {
  subnet_id      = aws_subnet.mypublicsubnetass.id
  route_table_id = aws_route_table.bar.id
}
