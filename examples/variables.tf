variable "ecs_cluster_name" {
    description = "The name of the ECS cluster"
    type = string
}

variable "vpc_id" {
    description = "The ID of the VPC"
    type = string
}

variable "tailscale_auth_key" {
    description = "The Tailscale auth key"
    type = string
    sensitive = true
}