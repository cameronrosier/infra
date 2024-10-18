resource "aws_ecs_cluster" "robopd2_cluster" {
  name = var.cluster_name

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.cluster_name
  }

}

resource "aws_ecs_task_definition" "task" {
  for_each = { for app in var.ecs_apps : app.name => app }

  family             = "${each.key}-task"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_iam_role.arn
  network_mode       = "bridge"

  container_definitions = jsonencode([
    {
      name      = each.key
      image     = each.value.image
      cpu       = each.value.cpu
      memory    = each.value.memory
      essential = true
      portMappings = [
        {
          containerPort = each.value.ports.containerPort
          hostPort      = each.value.ports.hostPort
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/${each.key}"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = each.key
        }
      }
    }
  ])
}

resource "aws_ecs_service" "service" {
  for_each        = { for app in var.ecs_apps : app.name => app }
  name            = "${each.key}-service"
  cluster         = aws_ecs_cluster.robopd2_cluster.id
  task_definition = aws_ecs_task_definition.task[each.key].arn
  desired_count   = 1
  launch_type     = "EC2"

  # network_configuration {
  #   subnets = [aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id, aws_subnet.private_subnet[2].id]
  # }

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }

  ordered_placement_strategy {
    type  = "binpack"
    field = "memory"
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.ecs_target_group.arn
    container_name   = each.key
    container_port   = each.value.ports.containerPort
  }
}

