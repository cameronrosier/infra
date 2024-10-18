resource "aws_ecr_repository" "ecr" {
  for_each = {
    for app in var.ecs_apps :
    app.name => app
  }

  name         = each.key
  force_delete = var.ecr_force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  lifecycle {
    ignore_changes = [
      image_scanning_configuration
    ]
  }
}