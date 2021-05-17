output "jmeter_master_id" {
  value = aws_instance.jmeter_master.*.id
}

output "jmeter_slave_id" {
  value = aws_instance.jmeter_slave.*.id
}

output "jmeter_sg_id" {
  value = aws_security_group.jmeter_sg.id
}
