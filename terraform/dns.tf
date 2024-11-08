resource "aws_route53_zone" "robopd2" {
  name = var.domain_name
}

resource "aws_route53_record" "robopd2" {
  zone_id = aws_route53_zone.robopd2.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_lb.public_nlb.dns_name
    zone_id                = aws_lb.public_nlb.zone_id
    evaluate_target_health = true
  }
}

################
# External DNS #
################
resource "kubernetes_service_account" "external_dns" {
  metadata {
    name      = "external-dns"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.external_dns.arn
    }
  }
  automount_service_account_token = true
}

resource "kubernetes_cluster_role" "external_dns" {
  metadata {
    name = "external-dns"
  }

  rule {
    api_groups = [""]
    resources  = ["services", "pods", "nodes"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["extensions", "networking.k8s.io"]
    resources  = ["ingresses"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["networking.istio.io"]
    resources  = ["gateways"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "external_dns" {
  metadata {
    name = "external-dns"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.external_dns.metadata.0.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.external_dns.metadata.0.name
    namespace = kubernetes_service_account.external_dns.metadata.0.namespace
  }
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  namespace  = kubernetes_service_account.external_dns.metadata.0.namespace
  wait       = true
  repository = var.external_dns_chart_repo
  chart      = var.external_dns_chart_name
  version    = var.external_dns_chart_version

  set {
    name  = "rbac.create"
    value = false
  }

  set {
    name  = "serviceAccount.create"
    value = false
  }

  set {
    name  = "serviceAccount.name"
    value = kubernetes_service_account.external_dns.metadata.0.name
  }

  set {
    name  = "rbac.pspEnabled"
    value = false
  }

  set {
    name  = "name"
    value = "${var.cluster_name}-external-dns"
  }

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "policy"
    value = "sync"
  }

  set {
    name  = "logLevel"
    value = var.external_dns_chart_log_level
  }

  set {
    name  = "sources"
    value = "{ingress,service}"
  }

  set {
    name  = "domainFilters"
    value = "{${join(",", var.external_dns_domain_filters)}}"
  }

  set {
    name  = "aws.zoneType"
    value = ""
  }

  set {
    name  = "aws.region"
    value = "us-east-1"
  }
}