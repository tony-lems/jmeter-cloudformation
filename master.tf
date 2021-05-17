resource "aws_instance" "jmeter_master" {
  count           = var.master_instance_count
  ami             = var.instance_ami
  instance_type   = var.master_instance_type
  security_groups = ["${aws_security_group.jmeter_sg.name}"]
  key_name        = aws_key_pair.jmeter_master_keypair.key_name
  user_data       = file("os_config.sh")
  tags = {
    "Name" = "jmeter_master"
  }
}

resource "tls_private_key" "master_kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jmeter_master_keypair" {
  key_name   = "jmeter_master_keypair"
  public_key = tls_private_key.master_kp.public_key_openssh
}
