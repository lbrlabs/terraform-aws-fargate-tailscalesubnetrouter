output "task_exec_role_arn" {
  value = aws_iam_role.exec_role.arn
}

output "task_exec_role_name" {
  value = aws_iam_role.exec_role.name
}