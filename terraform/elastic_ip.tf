resource "aws_eip" "jks_master_ec2_eip" {
  instance = aws_instance.jks_master_ec2.id
  vpc      = true

  tags = {
    Name = "${var.stack_id}-jks-eip"
  }

}