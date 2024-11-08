resource "aws_lb" "public_nlb" {
  name                             = "robopd2-public-nlb"
  internal                         = false
  load_balancer_type               = "network"
  security_groups                  = [aws_security_group.public_sg.id]
  subnets                          = aws_subnet.public_subnet[*].id

  tags = {
    Name = "robopd2-public-nlb"
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.public_nlb.arn
  port              = 80
  protocol          = "TCP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_to_private_alb.arn
  }
}

resource "aws_lb_target_group" "nlb_to_private_alb" {
  name        = "robopd2-nlb-to-private-alb-tg"
  port        = 80
  protocol    = "TCP"
  target_type = "alb"
  vpc_id      = aws_vpc.robopd2_vpc.id
  tags = {
    Name = "robopd2-nlb-to-private-alb-tg"
  }
}

resource "aws_lb_target_group_attachment" "nlb_to_private_alb_attachment" {
  target_group_arn = aws_lb_target_group.nlb_to_private_alb.arn
  target_id        = data.external.robopd2_internal_loadbalancer_arn.result["arn"]
  port             = 80
}