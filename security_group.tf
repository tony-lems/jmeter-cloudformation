resource "aws_security_group" "jmeter_sg" {
  name = "jmeter_sg"
}

resource "aws_security_group_rule" "ingress_private_sgr" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = -1
  self = true

  security_group_id = "${aws_security_group.jmeter_sg.id}"
}

resource "aws_security_group_rule" "egress_private_sgr" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = -1
  self = true

  security_group_id = "${aws_security_group.jmeter_sg.id}"
}

resource "aws_security_group_rule" "egress_public_sgr" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jmeter_sg.id}"
}

resource "aws_security_group_rule" "ingress_public_sgr" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jmeter_sg.id}"
}