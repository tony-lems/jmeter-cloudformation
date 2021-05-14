resource "aws_instance" "jmeter-master" {
  ami           = "ami-00399ec92321828f5"
  instance_type = var.master_instance_type
  security_groups = [ "${aws_security_group.jmeter-sg.name}" ]
  key_name      = aws_key_pair.jmeter-master-keypair.key_name
  user_data = file("os_config.sh")
  tags = {
    "Name" = "jmeter-master"
  }
}

resource "tls_private_key" "master-kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "jmeter-master-keypair" {
  key_name   = "jmeter-master-keypair"
  public_key = tls_private_key.master-kp.public_key_openssh
}