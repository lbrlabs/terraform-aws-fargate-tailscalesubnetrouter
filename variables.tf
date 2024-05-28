variable "name" {
  type        = string
  description = "A name for the Tailscale subnet router"
}

variable "cpu" {
  type        = number
  default     = 256
  description = "The CPU value to assign to the container (vCPU)"
}

variable "memory" {
  type        = number
  default     = 512
  description = "The memory value to assign to the container (MiB)"
}

variable "cpu_architecture" {
  type        = string
  default     = "X86_64"
  description = "The CPU architecture to use for the container. Either X86_64 or ARM64."
}

variable "assign_public_ip" {
  type        = bool
  default     = true
  description = "Assign a public IP address to the container"
}

variable "security_group_ids" {
  type        = list(string)
  description = "The security group IDs to associate with the subnet router ECS service and EFS mount targets"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The subnet IDs to use for the ECS task"
}

variable "ecs_cluster_id" {
  type        = string
  description = "The ID of the ECS cluster"
}

variable "tailscale_auth_key_secret" {
  type        = string
  description = "The secret manager ARN for the Tailscale auth key"
}

variable "tailscale_hostname" {
  type        = string
  description = "The hostname of the tailscale client"
}

variable "tailscale_subnet_routes" {
  type        = string
  description = "The subnet routes to advertise to the Tailscale network"
  default     = ""
}

variable "tailscale_extra_args" {
  type        = string
  description = "The extra arguments to pass to the Tailscale cotnainer"
  default     = ""
}

variable "cloudwatch_retention_days" {
  type        = number
  description = "The number of days to retain logs in CloudWatch"
  default     = 7
}
