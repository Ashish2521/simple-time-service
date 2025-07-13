resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = var.private_subnet_a
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = var.private_subnet_b
  route_table_id = aws_route_table.this.id
}
