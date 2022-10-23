# creating internet gateway

resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.sarika-vpc.id

  tags = {
    Name = "IG"
  }
}

# creating Elastic IP for NAT Gateway

resource "aws_eip" "EIP" {
  vpc      = true
}

# creating NAT Gateway

resource "aws_nat_gateway" "my-NAT-Gateway" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = {
    Name = "my-NAT-Gateway"
  }

  depends_on = [aws_internet_gateway.IG]
}