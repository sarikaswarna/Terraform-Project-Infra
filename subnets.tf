# creating the public subnets for both Availability Zone 1A and 1B

resource "aws_subnet" "public-subnet-1a" {
  vpc_id     = aws_vpc.sarika-vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = var.AZ-1a
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub-subnet-1a"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id     = aws_vpc.sarika-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = var.AZ-1b
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub-subnet-1b"
  }
}

# creating private subnets for Availability Zone 1A and 1B

resource "aws_subnet" "private-subnet-1a" {
  vpc_id     = aws_vpc.sarika-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = var.AZ-1a
  map_public_ip_on_launch = "true"
  

  tags = {
    Name = "pvt-subnet-1a"
  }
}


resource "aws_subnet" "private-subnet-1b" {
  vpc_id     = aws_vpc.sarika-vpc.id
  cidr_block = "10.10.4.0/24"
  availability_zone = var.AZ-1b
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pvt-subnet-1b"
  }
}