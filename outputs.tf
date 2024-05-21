output "task_exec_role_arn" {
  value = aws_iam_role.exec_role.arn
}

output "task_exec_role_name" {
  value = aws_iam_role.exec_role.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.tailscale.arn
}

output "task_definition_family" {
  value = aws_ecs_task_definition.tailscale.family
}

output "task_definition_revision" {
  value = aws_ecs_task_definition.tailscale.revision
}

output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.tailscale.name
}