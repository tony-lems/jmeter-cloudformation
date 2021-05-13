resource "aws_instance" "JMeter_Slave" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  #vpc_security_group_ids = ["aws_security_group.JMeter_Master.id"]
  user_data = file("os_config.sh")
  tags = {
    "Name"  = "JMeter_Slave"
    "Owner" = "Anton Popov"
  }
}