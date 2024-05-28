resource "aws_cloudwatch_log_group" "tailscale" {
  name = "/ecs/${var.name}"

  #checkov:skip=CKV_AWS_338:Configurable retention
  #checkov:skip=CKV_AWS_158:FIXME: should make this configurable
  retention_in_days = var.cloudwatch_retention_days
}
