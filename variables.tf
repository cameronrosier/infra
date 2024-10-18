# ============= #
# DNS Variables #
# ============= #
variable "domain_name" {
  description = "The domain name to use for the Route 53 hosted zone"
  type        = string
  default     = "robopd2.com"
}

# ==================== #
# Networking Variables #
# ==================== #
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of maps containing the public subnet definitions"
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "A list of maps containing the private subnet definitions"
  type = list(object({
    cidr = string
    az   = string
  }))
}

# =================== #
# ASG / EC2 Variables #
# =================== #
variable "image_id" {
  description = "The AMI ID to use for the launch template"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon ECS optimized AMI for us-east-1
}

variable "instance_type" {
  description = "The instance type to use for the launch template"
  type        = string
  default     = "t3.medium"
}

variable "autoscaling_max_size" {
  description = "The maximum number of instances in the autoscaling group"
  type        = number
  default     = 2
}

variable "autoscaling_min_size" {
  description = "The minimum number of instances in the autoscaling group"
  type        = number
  default     = 1
}

variable "autoscaling_desired_capacity" {
  description = "The desired number of instances in the autoscaling group"
  type        = number
  default     = 1
}

# ============= #
# ECR Variables #
# ============= #
variable "ecr_force_delete" {
  description = "Whether or not to force delete the ECR repository"
  type        = bool
  default     = true
}

variable "scan_on_push" {
  description = "Whether or not to scan images on push"
  type        = bool
  default     = true
}

# ============= #
# ECS Variables #
# ============= #
variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_apps" {
  description = "A list of maps containing the ECS app definitions"
  type = list(object({
    name   = string
    image  = string
    ports  = map(number)
    cpu    = number
    memory = number
  }))
}

# ======================= #
# Load Balancer Variables #
# ======================= #
variable "internal_lb_name" {
  description = "The name of the internal load balancer"
  type        = string
}

variable "internal_lb_type" {
  description = "The type of internal load balancer to create"
  type        = string
}

# ==================== #
# CloudWatch Variables #
# ==================== #
variable "retention_in_days" {
  description = "The number of days to retain CloudWatch logs"
  type        = number
  default     = 14
}

# ==================== #
# CloudFront Variables #
# ==================== #
variable "custom_origin_host_header" {
  description = "The custom origin host header to use for the CloudFront distribution"
  type        = string
  default     = ""
}