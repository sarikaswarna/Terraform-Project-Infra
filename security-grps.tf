# creating security- group for ec2

resource "aws_security_group" "allow_80-22" {
  name        = "allow-port-80-and-port-22"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.sarika-vpc.id

  ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80-22"
  }
}


# creating SG for Load Balancer

resource "aws_security_group" "allow_80-for-LB" {
  name        = "allow-port-80"
  description = "Allow HTTP"
  vpc_id      = aws_vpc.sarika-vpc.id


  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80-for-LB"
  }
}