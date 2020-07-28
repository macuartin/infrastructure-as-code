resource "aws_route_table" "public_crt" { 
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"

      gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
      Name = "${var.stack_id}-public-crt"
  }
}

resource "aws_route_table_association" "crta_public_subnet_primary" {
    subnet_id = aws_subnet.public_subnet_primary.id
    route_table_id = aws_route_table.public_crt.id
}

resource "aws_route_table_association" "crta_public_subnet_secondary" {
    subnet_id = aws_subnet.public_subnet_secondary.id
    route_table_id = aws_route_table.public_crt.id
}