variable "slave_instance_type" {
  description = "Instance type for slave nodes"
  default     = "t2.micro"
}

variable "master_instance_type" {
  description = "Instance type for master node"
  default     = "t2.micro"
}

variable "region" {
  description = "Region to use"
  default     = "us-east-2"
}

variable "jmeter_url" {
  description = "URL to download JMeter binary"
  default = ""
}

variable "jmeter_version" {
  description = "Specify the version of JMeter"
  default = "5.1"
}