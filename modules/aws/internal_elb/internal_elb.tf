resource "aws_lb" "internal_nlb" {
  name = "${var.profile}-internal-nlb"
  internal = var.internal_option
  load_balancer_type = var.lb_type
  subnets            = var.subnets
}

resource "aws_lb_listener" "internal_nlb_listener" {
    load_balancer_arn = aws_lb.internal_nlb.arn
    port = var.serverport
    protocol = "TCP"
    default_action {
        target_group_arn = aws_lb_target_group.was_target_group.arn
        type = "forward"
    }
}

resource "aws_lb_target_group" "was_target_group" {
    name = "${var.profile}-was-target"
    port = var.serverport
    protocol = "TCP"
    target_type = var.target_type
    vpc_id = var.vpc_id

}