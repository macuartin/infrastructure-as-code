# Load Balancers

resource "aws_lb" "prod_load_balancer" {
  name               = "${var.stack_id}-prod-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_prod_lb.id]
  subnets            = [aws_subnet.public_subnet_primary.id, aws_subnet.public_subnet_secondary.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

# Target Groups

resource "aws_lb_target_group" "jks_lb_tg" {
  name     = "${var.stack_id}-jks-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id
}

# Load Balancer Listeners

resource "aws_lb_listener" "jks_lb_listener" {
  load_balancer_arn = aws_lb.prod_load_balancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:${var.region}:${var.account_id}:certificate/46515d3b-b39a-4424-a3e4-33615588273b"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jks_lb_tg.arn
  }
}

# Load Balancer Attachment

resource "aws_lb_target_group_attachment" "jks_lb_attachment" {
  target_group_arn = aws_lb_target_group.jks_lb_tg.arn
  target_id        = aws_instance.jks_master_ec2.id
  port             = 8080
}
