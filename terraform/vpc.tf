# VPC Network Setup
resource "aws_vpc" "robopd2_vpc" {

  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name                                        = "${var.app_name}-vpc"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.robopd2_vpc.id
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name                                        = "${var.app_name}-private-subnet-${count.index}"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.robopd2_vpc.id
  cidr_block        = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name                                        = "${var.app_name}-public-subnet-${count.index}"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }

  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.robopd2_vpc.id

  tags = {
    Name = "${var.vpc_tag_name}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.robopd2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.route_table_tag_name}"
  }
}

resource "aws_route_table_association" "internet_access" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.main.id
}

resource "aws_eip" "main" {}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "NAT Gateway for Custom Kubernetes Cluster"
  }
}

resource "aws_route" "main" {
  route_table_id         = aws_vpc.robopd2_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}