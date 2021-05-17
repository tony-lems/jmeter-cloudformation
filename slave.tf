resource "aws_instance" "jmeter-slave" {
  count           = var.slave_instance_count
  ami             = var.instance_ami
  instance_type   = var.slave_instance_type
  security_groups = ["${aws_security_group.jmeter-sg.name}"]
  key_name        = aws_key_pair.jmeter-slave-keypair.key_name
  user_data       = file("os_config.sh")
  tags = {
    "Name" = "jmeter-slave"
  }
}

resource "tls_private_key" "slave-kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jmeter-slave-keypair" {
  key_name   = "jmeter-slave-keypair"
  public_key = tls_private_key.slave-kp.public_key_openssh
}
