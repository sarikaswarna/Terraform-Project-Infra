# creating public Route Table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.sarika-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }


  tags = {
    Name = "public-route-table"
  }
}


# creating public Route Table association

resource "aws_route_table_association" "public-RT-association-1a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_route_table_association" "public-RT-association-1b" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public-route-table.id
}


# creating Private Route Table

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.sarika-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-NAT-Gateway.id
  }


  tags = {
    Name = "private-route-table"
  }
}

# creating Private Route Table Association

resource "aws_route_table_association" "private-RT-association-1a" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-RT-association-1b" {
  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.private-route-table.id
}