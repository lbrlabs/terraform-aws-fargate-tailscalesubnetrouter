data "aws_region" "current" {}

resource "aws_ecs_service" "tailscale" {
  name                  = var.name
  cluster               = var.ecs_cluster_id
  task_definition       = aws_ecs_task_definition.tailscale.arn
  desired_count         = 1
  wait_for_steady_state = true
  launch_type           = "FARGATE"

  deployment_circuit_breaker {
    enable   = false
    rollback = false
  }

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_group_ids
    subnets          = var.subnet_ids
  }
}

resource "aws_ecs_task_definition" "tailscale" {
  family                   = var.name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.exec_role.arn

  container_definitions = local.container_definition


  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = var.cpu_architecture
  }
}
