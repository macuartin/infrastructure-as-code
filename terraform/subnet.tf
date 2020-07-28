resource "aws_subnet" "public_subnet_primary" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.stack_id}-public-subnet-primary"
  }
}

resource "aws_subnet" "public_subnet_secondary" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.stack_id}-public-subnet-secondary"
  }
}