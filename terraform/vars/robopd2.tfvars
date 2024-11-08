cluster_name    = "robopd2-eks-cluster"
vpc_tag_name    = "Robopd2 VPC"
region          = "us-east-1"
node_group_name = "robopd2-node-group"
cluster_sg_name = "robopd2-eks-cluster-sg"
nodes_sg_name   = "robopd2-eks-nodes-sg"

alb_ingress_controller_name            = "robopd2-eks-alb-ingress-controller"
alb_ingress_controller_chart_repo      = "https://aws.github.io/eks-charts"
alb_ingress_controller_chart_name      = "aws-load-balancer-controller"
alb_ingress_controller_chart_namespace = "kube-system"
alb_ingress_controller_chart_version   = "1.10.0"

external_dns_chart_version   = "8.5.1"
external_dns_chart_repo      = "https://charts.bitnami.com/bitnami"
external_dns_chart_name      = "external-dns"
external_dns_chart_log_level = "info"
external_dns_domain_filters  = ["robopd2.com"]

# Application Ingress Definitions
app_root_domain = "robopd2.com"
app_ingress_rules = [
  {
    path         = "/"
    service_name = "robopd2-api"
    service_port = 8000
  },
  {
    path         = "/"
    service_name = "robopd2-ui"
    service_port = 3000
  }
]