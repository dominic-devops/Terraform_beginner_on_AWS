resource "aws_security_group" "elb_template" {
    name = "${var.profile}-external-alb"
    vpc_id=var.vpc_id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
      Name = "${var.profile}-elb_template-sg"
    }
}

resource "aws_lb" "elb_template" {
  name = "${var.profile}-${var.elb_name}"
  security_groups = [aws_security_group.elb_template.id]
  internal = var.internal_option
  load_balancer_type = var.lb_type
  subnets            = var.subnets
}

resource "aws_lb_listener" "elb_listener_template" {
    load_balancer_arn = aws_lb.elb_template.arn
    port = var.serverport
    protocol = var.protocol
    default_action {
        target_group_arn = aws_lb_target_group.web_target_group.arn
        type = "forward"
    }
}

resource "aws_lb_target_group" "elb_target_group" {
    name = "${var.profile}-web-target"
    port = var.serverport
    protocol = var.protocol
    target_type = var.target_type
    vpc_id = var.vpc_id

}