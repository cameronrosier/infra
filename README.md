## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb.alb](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/alb) | resource |
| [aws_alb_listener.alb_default_listener_https](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/alb_listener) | resource |
| [aws_alb_listener_rule.https_listener_rule](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/alb_listener_rule) | resource |
| [aws_alb_target_group.ecs_target_group](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/alb_target_group) | resource |
| [aws_appautoscaling_policy.ecs_cpu_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.ecs_memory_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.ecs_target](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/appautoscaling_target) | resource |
| [aws_autoscaling_group.ecs_asg](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/autoscaling_group) | resource |
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_repository.ecr](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/ecr_repository) | resource |
| [aws_ecs_capacity_provider.cas](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.robopd2_cluster](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.cas](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.service](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.task](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/ecs_task_definition) | resource |
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/eip) | resource |
| [aws_iam_instance_profile.ecs_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_service_role](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_iam_role](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ecs_instance_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/internet_gateway) | resource |
| [aws_key_pair.robopd2_key_pair](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/key_pair) | resource |
| [aws_launch_template.ecs_launch_template](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/launch_template) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/nat_gateway) | resource |
| [aws_route.private_route](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route) | resource |
| [aws_route.public_route](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route) | resource |
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.robopd2](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route53_zone) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/route_table_association) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/security_group) | resource |
| [aws_security_group.ecs_sg](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb_cloudfront_https_ingress_only](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/vpc) | resource |
| [aws_ec2_managed_prefix_list.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/ec2_managed_prefix_list) | data source |
| [aws_iam_policy_document.ecs_service_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.task_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autoscaling_desired_capacity"></a> [autoscaling\_desired\_capacity](#input\_autoscaling\_desired\_capacity) | The desired number of instances in the autoscaling group | `number` | `1` | no |
| <a name="input_autoscaling_max_size"></a> [autoscaling\_max\_size](#input\_autoscaling\_max\_size) | The maximum number of instances in the autoscaling group | `number` | `2` | no |
| <a name="input_autoscaling_min_size"></a> [autoscaling\_min\_size](#input\_autoscaling\_min\_size) | The minimum number of instances in the autoscaling group | `number` | `1` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the ECS cluster | `string` | n/a | yes |
| <a name="input_custom_origin_host_header"></a> [custom\_origin\_host\_header](#input\_custom\_origin\_host\_header) | The custom origin host header to use for the CloudFront distribution | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use for the Route 53 hosted zone | `string` | `"robopd2.com"` | no |
| <a name="input_ecr_force_delete"></a> [ecr\_force\_delete](#input\_ecr\_force\_delete) | Whether or not to force delete the ECR repository | `bool` | `true` | no |
| <a name="input_ecs_apps"></a> [ecs\_apps](#input\_ecs\_apps) | A list of maps containing the ECS app definitions | <pre>list(object({<br/>    name   = string<br/>    image  = string<br/>    ports  = map(number)<br/>    cpu    = number<br/>    memory = number<br/>  }))</pre> | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The AMI ID to use for the launch template | `string` | `"ami-0c55b159cbfafe1f0"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use for the launch template | `string` | `"t3.medium"` | no |
| <a name="input_internal_lb_name"></a> [internal\_lb\_name](#input\_internal\_lb\_name) | The name of the internal load balancer | `string` | n/a | yes |
| <a name="input_internal_lb_type"></a> [internal\_lb\_type](#input\_internal\_lb\_type) | The type of internal load balancer to create | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A list of maps containing the private subnet definitions | <pre>list(object({<br/>    cidr = string<br/>    az   = string<br/>  }))</pre> | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of maps containing the public subnet definitions | <pre>list(object({<br/>    cidr = string<br/>    az   = string<br/>  }))</pre> | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain CloudWatch logs | `number` | `14` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Whether or not to scan images on push | `bool` | `true` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC | `string` | n/a | yes |

## Outputs

No outputs.
