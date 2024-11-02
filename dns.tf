resource "aws_route53_zone" "robopd2" {
  name = var.domain_name
}

module "eks-external-dns" {
    source  = "lablabs/eks-external-dns/aws"
    version = "1.2.0"
    cluster_identity_oidc_issuer =  aws_eks_cluster.main.identity[0].oidc[0].issuer
    cluster_identity_oidc_issuer_arn = aws_iam_openid_connect_provider.default.arn
    policy_allowed_zone_ids = [
      aws_route53_zone.robopd2.zone_id
    ]
    settings = {
    "policy" = "sync" # syncs DNS records with ingress and services currently on the cluster.
  }
  depends_on = [
    aws_route53_zone.robopd2,
    aws_eks_cluster.main,
    aws_iam_openid_connect_provider.default
  ]
}

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.robopd2.zone_id
#   name    = "www.${var.domain_name}"
#   type    = "CNAME"
#   ttl     = 300
#   records = [aws_alb.alb.dns_name]
# }