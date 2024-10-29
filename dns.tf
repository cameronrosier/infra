# resource "aws_route53_zone" "robopd2" {
#   name = var.domain_name
# }

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.robopd2.zone_id
#   name    = "www.${var.domain_name}"
#   type    = "CNAME"
#   ttl     = 300
#   records = [aws_alb.alb.dns_name]
# }