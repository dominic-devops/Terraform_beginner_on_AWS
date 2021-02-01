output "ex_alb_sg_id" {
  description = "output sg id"
  value       = aws_security_group.external_alb.id
}

output "ex_alb_dns_name" {
  value = aws_lb.external_alb.dns_name
}

output "ex_alb_arn" {
  value = aws_lb.external_alb.arn
}

