# creating the EC2 instance in public subnet 1A
resource "aws_instance" "webapp-1a" {
    ami = var.EC2-AMI
    key_name = var.key_name
    instance_type = var.instance_type
    subnet_id = aws_subnet.public-subnet-1a.id
    vpc_security_group_ids = [aws_security_group.allow_80-22.id]

    tags = {
        Name = "WEBAPP-1A"
    }
}

# creating private instance in private-subnet-1a

resource "aws_instance" "webapp-pvt-1a" {
    ami = var.EC2-AMI
    key_name = var.key_name
    instance_type = var.instance_type
    subnet_id = aws_subnet.private-subnet-1a.id
  
    
    tags = {
        Name = "WEBAPP-PVT-1A"
    }
}

# creating EC2 instance in public subnet 1B

resource "aws_instance" "Bastion-HOST" {
    ami = var.EC2-AMI
    key_name = var.key_name
    instance_type = var.instance_type
    subnet_id = aws_subnet.public-subnet-1b.id
    vpc_security_group_ids = [aws_security_group.allow_80-22.id]

    
    tags = {
        Name = "Bastion-Host"
    }
}