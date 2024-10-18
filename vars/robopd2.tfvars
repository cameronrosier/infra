# ============= #
# ASG Variables #
# ============= #
image_id      = "ami-0866a3c8686eaeeba" # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
instance_type = "t2.micro"

# ======================= #
# Load Balancer Variables #
# ======================= #
internal_lb_name = "robopd2-internal-load-balancer"
internal_lb_type = "application"

# ============= #
# VPC Variables #
# ============= #
vpc_cidr = "10.0.0.0/16"

public_subnets = [
  {
    cidr = "10.0.1.0/24"
    az   = "us-east-1a"
    subnet_number = 1
  }
]

private_subnets = [
  {
    cidr = "10.0.2.0/24"
    az   = "us-east-1a"
    subnet_number = 1
  },
  {
    cidr = "10.0.3.0/24"
    az   = "us-east-1b"
    subnet_number = 2
  },
  {
    cidr = "10.0.4.0/24"
    az   = "us-east-1c"
    subnet_number = 3
  }
]

# ============= #
# ECS Variables #
# ============= #
cluster_name = "robopd2-ecs-cluster"
ecs_apps = [
  {
    name  = "robopd2-api"
    image = "robopd2-api:latest"
    ports = {
      containerPort = 8000
      hostPort      = 8000
    }
    cpu    = 256
    memory = 512
  },
  {
    name  = "robopd2-ui"
    image = "robopd2-ui:latest"
    ports = {
      containerPort = 80
      hostPort      = 80
    }
    cpu    = 256
    memory = 512
  },
  {
    name  = "robopd2-twitch-bot"
    image = "robopd2-twitch-bot:latest"
    ports = {
      containerPort = 6667
      hostPort      = 6667
    }
    cpu    = 256
    memory = 512
  }
]