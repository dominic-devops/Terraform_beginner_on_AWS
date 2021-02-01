resource "aws_security_group" "sg_template" {
    name = "${var.profile}-${var.sg_name}"
    vpc_id = var.vpc_id
    description = var.description
  ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = var.protocol
    cidr_blocks = var.sg_cidr_blocks
  }

  ingress {
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    security_groups = var.security_groups
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
      Name = "${var.profile}-${var.sg_name}-sg"
    }
}
