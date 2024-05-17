resource "aws_cloudwatch_log_group" "tailscale" {
  name = "/ecs/${var.name}"

  retention_in_days = 7
}