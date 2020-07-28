resource "aws_security_group" "sg_ssh_allow" { 
  vpc_id = aws_vpc.main_vpc.id
  name = "${var.stack_id}-ssh-sg"
  description = "Allow SSH and http inbound traffic"

  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_security_group" "sg_prod_lb" { 
  vpc_id = aws_vpc.main_vpc.id
  name = "${var.stack_id}-prod-lb-sg"
  description = "Allow https inbound traffic"

  ingress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

}