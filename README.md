<!-- BEGIN_TF_DOCS -->




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign a public IP address to the container | `bool` | `true` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The CPU value to assign to the container (vCPU) | `number` | `256` | no |
| <a name="input_cpu_architecture"></a> [cpu\_architecture](#input\_cpu\_architecture) | The CPU architecture to use for the container. Either X86\_64 or ARM64. | `string` | `"X86_64"` | no |
| <a name="input_ecs_cluster_id"></a> [ecs\_cluster\_id](#input\_ecs\_cluster\_id) | The ID of the ECS cluster | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | The memory value to assign to the container (MiB) | `number` | `512` | no |
| <a name="input_name"></a> [name](#input\_name) | A name for the Tailscale subnet router | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | The security group IDs to associate with the subnet router ECS service and EFS mount targets | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet IDs to use for the ECS task | `list(string)` | n/a | yes |
| <a name="input_tailscale_auth_key_secret"></a> [tailscale\_auth\_key\_secret](#input\_tailscale\_auth\_key\_secret) | The secret manager ARN for the Tailscale auth key | `string` | n/a | yes |
| <a name="input_tailscale_extra_args"></a> [tailscale\_extra\_args](#input\_tailscale\_extra\_args) | The extra arguments to pass to the Tailscale cotnainer | `string` | `""` | no |
| <a name="input_tailscale_hostname"></a> [tailscale\_hostname](#input\_tailscale\_hostname) | The hostname of the tailscale client | `string` | n/a | yes |
| <a name="input_tailscale_subnet_routes"></a> [tailscale\_subnet\_routes](#input\_tailscale\_subnet\_routes) | The subnet routes to advertise to the Tailscale network | `string` | `""` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_task_definition_arn"></a> [task\_definition\_arn](#output\_task\_definition\_arn) | n/a |
| <a name="output_task_definition_family"></a> [task\_definition\_family](#output\_task\_definition\_family) | n/a |
| <a name="output_task_definition_revision"></a> [task\_definition\_revision](#output\_task\_definition\_revision) | n/a |
| <a name="output_task_exec_role_arn"></a> [task\_exec\_role\_arn](#output\_task\_exec\_role\_arn) | n/a |
| <a name="output_task_exec_role_name"></a> [task\_exec\_role\_name](#output\_task\_exec\_role\_name) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.30 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.30 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.ecs_task_logs_tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_task_tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.exec_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_logs_tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.exec_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.ecs_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_task_logs_tailscale](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
<!-- END_TF_DOCS -->