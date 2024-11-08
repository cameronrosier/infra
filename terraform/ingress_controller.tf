resource "kubernetes_service_account" "service-account" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    labels = {
      "app.kubernetes.io/name"      = "aws-load-balancer-controller"
      "app.kubernetes.io/component" = "controller"
    }
    annotations = {
      "eks.amazonaws.com/role-arn"               = module.lb_role.iam_role_arn
      "eks.amazonaws.com/sts-regional-endpoints" = "true"
    }
  }
}

resource "helm_release" "aws_load_balancer_controller" {
  name       = var.alb_ingress_controller_name
  repository = var.alb_ingress_controller_chart_repo
  chart      = var.alb_ingress_controller_chart_name
  version    = var.alb_ingress_controller_chart_version
  namespace  = var.alb_ingress_controller_chart_namespace

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
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  depends_on = [
    kubernetes_service_account.service-account,
    aws_eks_node_group.main
  ]
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "robopd2"
  }
}

resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name      = var.app_ingress_name
    namespace = "robopd2"
    annotations = {
      "kubernetes.io/ingress.class"                = "alb"
      "alb.ingress.kubernetes.io/scheme"           = "internal"
      "alb.ingress.kubernetes.io/target-type"      = "ip"
      "alb.ingress.kubernetes.io/listen-ports"     = "[{\"HTTP\": 80}]"
      "alb.ingress.kubernetes.io/backend-protocol" = "HTTP"
    }
  }

  spec {
    default_backend {
      service {
        name = "robopd2-ui"
        port {
          number = 80
        }
      }
    }
    dynamic "rule" {
      for_each = var.app_ingress_rules
      content {
        host = var.app_root_domain
        http {
          path {
            path = rule.value.path

            backend {
              service {
                name = rule.value.service_name
                port {
                  number = rule.value.service_port
                }
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    helm_release.aws_load_balancer_controller,
    kubernetes_namespace.namespace
  ]
}