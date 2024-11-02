<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.73.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.73.0 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.4 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.16.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb_role"></a> [lb\_role](#module\_lb\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/eip) | resource |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.default](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.aws_eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_eks_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_eks_worker_node_policy](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_read_only](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm_access](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/nat_gateway) | resource |
| [aws_route.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/route) | resource |
| [aws_route53_zone.robopd2](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/route53_zone) | resource |
| [aws_route_table.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/route_table) | resource |
| [aws_route_table_association.internet_access](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/route_table_association) | resource |
| [aws_security_group.control_plane_sg](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group) | resource |
| [aws_security_group.data_plane_sg](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group) | resource |
| [aws_security_group.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group) | resource |
| [aws_security_group.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group) | resource |
| [aws_security_group.public_sg](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_inbound](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.cluster_outbound](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.control_plane_inbound](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.control_plane_outbound](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.node_outbound](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodes](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodes_inbound](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_egress_public](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_ingress_public_443](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sg_ingress_public_80](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/subnet) | resource |
| [aws_vpc.robopd2_vpc](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/resources/vpc) | resource |
| [helm_release.lb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.main](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.assume_workers](https://registry.terraform.io/providers/hashicorp/aws/5.73.0/docs/data-sources/iam_policy_document) | data source |
| [external_external.thumb](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_ingress_controller_name"></a> [alb\_ingress\_controller\_name](#input\_alb\_ingress\_controller\_name) | Name of the ALB Ingress Controller | `string` | n/a | yes |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2\_x86\_64. Valid values: AL2\_x86\_64, AL2\_x86\_64\_GPU. | `string` | `"AL2_ARM_64"` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the application | `string` | `"robopd2"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | List of availability zones for the selected region | `list(string)` | <pre>[<br/>  "us-east-1a",<br/>  "us-east-1b"<br/>]</pre> | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | The Helm chart name | `string` | n/a | yes |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | The Helm chart namespace | `string` | n/a | yes |
| <a name="input_chart_repo"></a> [chart\_repo](#input\_chart\_repo) | The Helm chart repository | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_cluster_sg_name"></a> [cluster\_sg\_name](#input\_cluster\_sg\_name) | Name of the EKS cluster Security Group | `string` | n/a | yes |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size in GiB for worker nodes. Defaults to 20. | `number` | `20` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the Route 53 hosted zone | `string` | `"robopd2.com"` | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Indicates whether or not the Amazon EKS private API server endpoint is enabled. | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled. | `bool` | `false` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Set of instance types associated with the EKS Node Group. | `list(string)` | <pre>[<br/>  "t4g.medium"<br/>]</pre> | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | Name of the Node Group | `string` | n/a | yes |
| <a name="input_nodes_sg_name"></a> [nodes\_sg\_name](#input\_nodes\_sg\_name) | Name of the EKS node group Security Group | `string` | n/a | yes |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | CIDR block ranges for the private subnets | `list(string)` | <pre>[<br/>  "10.0.0.0/24",<br/>  "10.0.1.0/24"<br/>]</pre> | no |
| <a name="input_private_subnet_tag_name"></a> [private\_subnet\_tag\_name](#input\_private\_subnet\_tag\_name) | Name tag for the private subnet | `string` | `"Robopd2 EKS Cluster Private Subnet"` | no |
| <a name="input_public_subnet_cidr_block"></a> [public\_subnet\_cidr\_block](#input\_public\_subnet\_cidr\_block) | CIDR block range for the public subnet | `string` | `"10.0.2.0/24"` | no |
| <a name="input_public_subnet_tag_name"></a> [public\_subnet\_tag\_name](#input\_public\_subnet\_tag\_name) | Name tag for the public subnet | `string` | `"Robopd2 EKS Cluster Public Subnet"` | no |
| <a name="input_pvt_desired_size"></a> [pvt\_desired\_size](#input\_pvt\_desired\_size) | Desired number of worker nodes in private subnet | `number` | `2` | no |
| <a name="input_pvt_max_size"></a> [pvt\_max\_size](#input\_pvt\_max\_size) | Maximum number of worker nodes in private subnet. | `number` | `2` | no |
| <a name="input_pvt_min_size"></a> [pvt\_min\_size](#input\_pvt\_min\_size) | Minimum number of worker nodes in private subnet. | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | aws region to deploy to | `string` | n/a | yes |
| <a name="input_route_table_tag_name"></a> [route\_table\_tag\_name](#input\_route\_table\_tag\_name) | Route table description | `string` | `"main"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR block range for vpc | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_tag_name"></a> [vpc\_tag\_name](#input\_vpc\_tag\_name) | Name tag for the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->