resource "aws_cloudwatch_log_group" "log_group" {
  for_each          = { for app in var.ecs_apps : app.name => app }
  name              = "/ecs/${each.key}"
  retention_in_days = var.retention_in_days
}