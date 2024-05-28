locals {
  container_definition = jsonencode([
    {
      name      = "tailscale"
      image     = "tailscale/tailscale"
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      "healthcheck" : {
        "command" : [
          "tailscale",
          "status"
        ],
        "interval" : 30,
        "timeout" : 5,
        "retries" : 3,
        "startPeriod" : 0
      },
      environment = [{
        "name" : "TS_HOSTNAME",
        "value" : var.tailscale_hostname
        }, {
        "name" : "TS_ROUTES",
        "value" : var.tailscale_subnet_routes
        }, {
        "name" : "TS_EXTRA_ARGS",
        "value" : var.tailscale_extra_args
      }]
      secrets = [{
        "name" : "TS_AUTH_KEY",
        "valueFrom" : var.tailscale_auth_key_secret
      }]
      logConfiguration = {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : aws_cloudwatch_log_group.tailscale.name,
          "awslogs-region" : "us-west-2",
          "awslogs-stream-prefix" : "ecs"
        }
      },
      linux_parameters = {
        "initProcessEnabled" : true
        "capabilities" : {
          "add" : ["NET_ADMIN"]
        }
      }
    }
  ])
}
