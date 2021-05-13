provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "jmeter-master" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "${var.master_instance_type}"
  #vpc_security_group_ids = ["aws_security_group.JMeter_Master.id"]
  user_data = file("os_config.sh")
  tags = {
    "Name"  = "jmeter-master"
  }
}

# resource "aws_key_pair" "OhioKP_pub" {
#   key_name      = "OhioKP_pub"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP1N5km/l7m7B2MUk6mVFaEGmXzseuqxpsJcZoY1w2TTMWF7UHuOK7K+sk/XZ115hn/Xl53Ks/VLxu6ydMXLTT9CcwYUZoiWTSIhFeg/uV8LH2A8FwR9d/LhieeyoIFw/GGkVS6p+wuM4DebggVhC89KuXq6qM/xlJbPBZG1b063nEEo/SAl4yPL5g1PwrdLGRGiutGxyImC7PMJKfLTKCs9eO0OxN9/9vtEeBtBzIrKz5gCepNrqzY2poVmJLJur9wJiK1d1JIfzDRfSABKSsoQHM5+GzBsOaO7Mm38FLLECyaWIXHxKjJKVaQJd7CRiChsXo8H5iJ0flYhnDknPH2r9yNwr3YuYG3fsXQA9fej5FQ96v6MUArlsjf/bLSW2RpGfyBnUfV2tKKed0SsKLnM14HZ65faxGCM3z+uvKRzJI2keILau8qylp9JHeldh3U0bp1CxE4jCXZis7nHN33TUEjQrM92tvV/hmsLUkUX1vb38WdE3tUg8flcfuhR8= anton@anton-VirtualBox"
# }

# resource "aws_security_group" "JMeter_Master" {
#   name = "JMeter Master Security Group"

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# }
