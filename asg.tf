resource "aws_launch_template" "ecs_launch_template" {
  name_prefix   = "robopd2-ecs-instance-"
  image_id      = var.image_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_instance_profile.name
  }

  user_data = base64encode("#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.robopd2_cluster.name} >> /etc/ecs/ecs.config")

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ecs_sg.id]
    subnet_id                   = aws_subnet.private_subnet[0].id
  }

}

resource "aws_autoscaling_group" "ecs_asg" {
  name = "robopd2-ecs-asg"

  launch_template {
    id      = aws_launch_template.ecs_launch_template.id
    version = "$Latest"
  }

  min_size              = var.autoscaling_min_size
  max_size              = var.autoscaling_max_size
  desired_capacity      = var.autoscaling_desired_capacity
  vpc_zone_identifier   = [for subnet in aws_subnet.private_subnet : subnet.id]
  target_group_arns     = [aws_alb_target_group.ecs_target_group.arn]
  termination_policies  = ["OldestInstance"]
  protect_from_scale_in = true

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances"
  ]

  instance_refresh {
    strategy = "Rolling"
  }

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "robopd2-ecs-instance"
    propagate_at_launch = true
  }

}

resource "aws_key_pair" "robopd2_key_pair" {
  key_name   = "robopd2-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}
