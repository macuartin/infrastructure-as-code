resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
    
  tags = {
    Name = "${var.stack_id}-igw"
  }
}