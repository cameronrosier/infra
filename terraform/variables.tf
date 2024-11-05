variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "robopd2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "route_table_tag_name" {
  type        = string
  default     = "main"
  description = "Route table description"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
  description = "CIDR block ranges for the private subnets"
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR block range for the public subnet"
}

variable "private_subnet_tag_name" {
  type        = string
  default     = "Robopd2 EKS Cluster Private Subnet"
  description = "Name tag for the private subnet"
}

variable "public_subnet_tag_name" {
  type        = string
  default     = "Robopd2 EKS Cluster Public Subnet"
  description = "Name tag for the public subnet"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of availability zones for the selected region"
}

variable "region" {
  description = "aws region to deploy to"
  type        = string
}

variable "node_group_name" {
  description = "Name of the Node Group"
  type        = string
}

variable "endpoint_private_access" {
  type        = bool
  default     = false
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type        = bool
  default     = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "endpoint_public_access_cidrs" {
  type    = list(string)
  default = [""]
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU."
  type        = string
  default     = "AL2_ARM_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20."
  type        = number
  default     = 20
}

variable "instance_types" {
  type        = list(string)
  default     = ["t4g.medium"]
  description = "Set of instance types associated with the EKS Node Group."
}

variable "pvt_desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default     = 2
  type        = number
}

variable "pvt_max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default     = 2
  type        = number
}

variable "pvt_min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default     = 1
  type        = number
}

variable "cluster_sg_name" {
  description = "Name of the EKS cluster Security Group"
  type        = string
}

variable "nodes_sg_name" {
  description = "Name of the EKS node group Security Group"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
  default     = "robopd2.com"
}

variable "alb_ingress_controller_name" {
  description = "Name of the ALB Ingress Controller"
  type        = string
}

variable "chart_repo" {
  description = "The Helm chart repository"
  type        = string
}

variable "chart_name" {
  description = "The Helm chart name"
  type        = string
}

variable "chart_namespace" {
  description = "The Helm chart namespace"
  type        = string
}

variable "chart_version" {
  description = "The Helm chart version"
  type        = string
}
