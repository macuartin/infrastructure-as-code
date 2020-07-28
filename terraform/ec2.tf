resource "aws_instance" "jks_master_ec2" { 
  ami = data.aws_ami.jenkins_image.id
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public_subnet_primary.id
  vpc_security_group_ids = [aws_security_group.sg_ssh_allow.id]

  key_name = "macuartin_key_pair"

    tags = {
      Name = "${var.stack_id}-jks-instance"
    }
}
