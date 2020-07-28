output "jks_master_ec2_ip_addr" {
  value = aws_instance.jks_master_ec2.public_ip
}

output "prod_load_balancer" {
  value = aws_lb.prod_load_balancer.dns_name
}