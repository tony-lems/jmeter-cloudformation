resource "aws_instance" "jmeter_slave" {
  count           = var.slave_instance_count
  ami             = var.instance_ami
  instance_type   = var.slave_instance_type
  security_groups = ["${aws_security_group.jmeter_sg.name}"]
  key_name        = aws_key_pair.jmeter_slave_keypair.key_name
  #user_data       = file("os_config.sh")
  tags = {
    "Name" = "jmeter_slave_${count.index}"
  }
}

provisioner "remote-exec" {
  script = "os_config.sh"
}

resource "tls_private_key" "slave_kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jmeter_slave_keypair" {
  key_name   = "jmeter_slave_keypair"
  public_key = tls_private_key.slave_kp.public_key_openssh
}
