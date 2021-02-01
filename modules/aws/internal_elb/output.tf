output "int_nlb_dns_name" {
  description = "output nlb FQDN"
  value = aws_lb.internal_nlb.dns_name
}

output "int_nlb_arn" {
  description = "output nlb arn"
  value = aws_lb.internal_nlb.arn
}