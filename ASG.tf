# creating launch_template

resource "aws_launch_template" "webapp-launch-template" {
  name_prefix   = "webapp"
  image_id      = "ami-0a8e86ceb9a2f15fe"
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_80-22.id]
}

# creating the Auto Scaling Group

resource "aws_autoscaling_group" "webapp-ASG" {
  desired_capacity   = 2
  max_size           = 3
  min_size           = 2
  vpc_zone_identifier = [aws_subnet.public-subnet-1a.id,aws_subnet.public-subnet-1b.id]

  launch_template {
    id      = aws_launch_template.webapp-launch-template.id
    version = "$Latest"
  }
}

# creating TG for ASG

resource "aws_lb_target_group" "webapp-TG" {
  name     = "webapp-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.sarika-vpc.id
}

# creating TG attachment for LB ASG

resource "aws_lb_target_group_attachment" "webapp-TG-attachment-1" {
  target_group_arn = aws_lb_target_group.webapp-TG.arn
  target_id        = aws_instance.webapp-1a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "webapp-TG-attachment-2" {
  target_group_arn = aws_lb_target_group.webapp-TG.arn
  target_id        = aws_instance.Bastion-HOST.id
  port             = 80
}

# creating the Load Balancer for ASG

resource "aws_lb" "webapp-ASG-LB" {
  name               = "webapp-ASG-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_80-for-LB.id]
  subnets            = [aws_subnet.public-subnet-1a.id,aws_subnet.public-subnet-1b.id]

 # enable_deletion_protection = true


  tags = {
    Environment = "production"
  }
}

# creating the ASG LB listener

resource "aws_lb_listener" "webapp-LB-listener" {
  load_balancer_arn = aws_lb.webapp-ASG-LB.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp-TG.arn
  }
}

