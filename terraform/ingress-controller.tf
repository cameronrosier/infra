resource "helm_release" "aws_load_balancer_controller" {
  name       = var.alb_ingress_controller_name
  repository = var.chart_repo
  chart      = var.chart_name
  version    = var.chart_version
  namespace  = var.chart_namespace

  set {
    name  = "clusterName"
    value = aws_eks_cluster.main.name
  }

  set {
    name  = "region"
    value = "us-east-1"
  }

  set {
    name  = "vpcId"
    value = aws_vpc.robopd2_vpc.id
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }
}
