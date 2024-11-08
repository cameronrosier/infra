resource "aws_iam_role" "eks_cluster" {
  name = var.cluster_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  lifecycle {
    create_before_destroy = true
    ignore_changes        = all
  }
}

resource "aws_iam_role_policy_attachment" "aws_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

######################
# EKS Node IAM Roles #
######################
resource "aws_iam_role" "eks_nodes" {
  name = "${var.cluster_name}-worker"

  assume_role_policy = data.aws_iam_policy_document.assume_workers.json

  lifecycle {
    create_before_destroy = true
    ignore_changes        = all
  }
}

data "aws_iam_policy_document" "assume_workers" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "aws_eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "aws_eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "ec2_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "ssm_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_instance_profile" "eks_nodes" {
  name = "${var.cluster_name}-worker-profile"
  role = aws_iam_role.eks_nodes.name
}

###############################
# Ingess Controller IAM Roles #
###############################
module "lb_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name                              = "${var.app_name}_eks_lb"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${replace(data.aws_eks_cluster.main.identity[0].oidc[0].issuer, "https://", "")}"
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }
}

resource "aws_iam_openid_connect_provider" "default" {
  url             = data.aws_eks_cluster.main.identity[0].oidc[0].issuer
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.external.thumb.result.thumbprint]
}

################
# External DNS #
################
resource "aws_iam_role" "external_dns" {
  name = "${var.cluster_name}-external-dns"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::*:oidc-provider/${data.aws_eks_cluster.main.identity[0].oidc[0].issuer}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${data.aws_eks_cluster.main.identity[0].oidc[0].issuer}:sub": "system:serviceaccount:kube-system:external-dns"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "external_dns" {
  name_prefix = "${var.cluster_name}-external-dns"
  role        = aws_iam_role.external_dns.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets"
        ]
        Resource = "arn:aws:route53:::hostedzone/*"
      },
      {
        Effect = "Allow"
        Action = [
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets"
        ]
        Resource = "*"
      }
    ]
  })
}
