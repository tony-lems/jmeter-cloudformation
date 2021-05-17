variable "master_instance_count" {
  description = "Specify count of JMeter master instances count to be created"
  default     = 1
  type        = number
}

variable "slave_instance_count" {
  description = "Specify count of JMeter slave instances count to be created"
  default     = 1
  type        = number
}

variable "slave_instance_type" {
  description = "Instance type for slave nodes"
  default     = "t2.micro"
  type        = string
}

variable "master_instance_type" {
  description = "Instance type for master node"
  default     = "t2.micro"
  type        = string
}

variable "instance_ami" {
  description = "Specify instance ami"
  default     = "ami-00399ec92321828f5"
  type        = string
}

variable "region" {
  description = "Region to use"
  default     = "us-east-2"
  type        = string
}

variable "jmeter_url" {
  description = "URL to download JMeter binary"
  default     = ""
  type        = string
}

variable "jmeter_version" {
  description = "Specify the version of JMeter"
  default     = "5.1"
  type        = string
}

variable "module_git_url" {
  description = "Specify the git URL to find module source files"
  default     = "github.com/tony-lems/jmeter-cloudformation"
  type        = string
}
