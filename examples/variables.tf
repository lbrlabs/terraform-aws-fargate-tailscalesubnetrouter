variable "vpc_id" {
    description = "The ID of the VPC"
    type = string
}

variable "tailscale_auth_key" {
    description = "The Tailscale auth key"
    type = string
    sensitive = true
}