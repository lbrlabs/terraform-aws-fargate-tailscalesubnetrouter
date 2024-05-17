data "aws_ecs_cluster" "main" {
  cluster_name = "lbr-cluster-2b09bc1"
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    SubnetType = "Public"
  }
}


resource "aws_security_group" "tailscale" {
  vpc_id      = var.vpc_id
  description = "Security group for Tailscale Fargate Subnet Router"
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  security_group_id = aws_security_group.tailscale.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 41641
  ip_protocol       = "udp"
  to_port           = 41641
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.tailscale.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_secretsmanager_secret" "tailscale_key" {
  name = "tailscale_auth_key"
}

resource "aws_secretsmanager_secret_version" "tailscale_key" {
  secret_id     = aws_secretsmanager_secret.tailscale_key.id
  secret_string = var.tailscale_auth_key
}

data "aws_iam_policy_document" "secret_policy" {
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [aws_secretsmanager_secret.tailscale_key.arn]
  }
}

resource "aws_iam_policy" "secrets" {
  name        = "secrets"
  description = "Secrets for Tailscale Fargate Subnet Router"
  policy      = data.aws_iam_policy_document.secret_policy.json
}

module "subnetrouter" {
  source             = "../"
  name               = "lbr-fargate-subnetrouter"
  subnet_ids         = data.aws_subnets.private.ids
  ecs_cluster_id = data.aws_ecs_cluster.main.id
  tailscale_hostname = "fargate-subnetrouter"
  tailscale_subnet_routes = "172.16.0.0/16"
  tailscale_auth_key_secret = aws_secretsmanager_secret.tailscale_key.arn
  security_group_ids = [aws_security_group.tailscale.id]
}

resource "aws_iam_role_policy_attachment" "secrets" {
  role       = module.subnetrouter.task_exec_role_name
  policy_arn = aws_iam_policy.secrets.arn
}
