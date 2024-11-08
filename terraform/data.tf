# Get AWS account ID
data "aws_caller_identity" "current" {}

# Fetch EKS cluster details
data "aws_eks_cluster" "main" {
  name = var.cluster_name

  depends_on = [
    aws_eks_cluster.main
  ]
}

# Fetch EKS cluster auth data
data "aws_eks_cluster_auth" "main" {
  name = data.aws_eks_cluster.main.name
}

data "external" "thumb" {
  program = ["kubergrunt", "eks", "oidc-thumbprint", "--issuer-url", data.aws_eks_cluster.main.identity[0].oidc[0].issuer]
}

data "http" "current_ip" {
  url = "http://checkip.amazonaws.com"
}

data "external" "robopd2_internal_loadbalancer_arn" {
  program = ["sh", "-c", "aws elbv2 describe-load-balancers --no-cli-pager --query 'LoadBalancers[?Scheme==`internal`].LoadBalancerArn' --output json | jq -r 'map({arn: .}) | add'"]
  depends_on = [
    kubernetes_ingress_v1.ingress  
  ]
}