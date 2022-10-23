# creating Target Group for Load balancer

resource "aws_lb_target_group" "My-LB-TG" {
  name     = "My-LB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.sarika-vpc.id
}

# creating TG attachment for LB

resource "aws_lb_target_group_attachment" "My-LB-TG-attachment-1" {
  target_group_arn = aws_lb_target_group.My-LB-TG.arn
  target_id        = aws_instance.webapp-1a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "My-LB-TG-attachment-2" {
  target_group_arn = aws_lb_target_group.My-LB-TG.arn
  target_id        = aws_instance.Bastion-HOST.id
  port             = 80
}

# creating the Load Balancer

resource "aws_lb" "My-LB" {
  name               = "My-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_80-for-LB.id]
  subnets            = [aws_subnet.public-subnet-1a.id,aws_subnet.public-subnet-1b.id]

 # enable_deletion_protection = true


  tags = {
    Environment = "production"
  }
}

# creaing the Listener

resource "aws_lb_listener" "My-LB-listener" {
  load_balancer_arn = aws_lb.My-LB.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.My-LB-TG.arn
  }
}