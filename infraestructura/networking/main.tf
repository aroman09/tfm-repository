resource "aws_internet_gateway" "tfm_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "tfm-igw"
  }
}

resource "aws_subnet" "tfm_subnet_publica" {
  vpc_id                  = var.vpc_id
  cidr_block               = "10.0.1.0/24"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = true
  tags = {
    Name = "tfm-subred-publica"
  }
}

resource "aws_subnet" "tfm_subnet_privada" {
  vpc_id           = var.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "tfm-subred-privada"
  }
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "tfm-nat-eip"
  }
}

resource "aws_nat_gateway" "tfm_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.tfm_subnet_publica.id
  tags = {
    Name = "tfm-nat"
  }
}

resource "aws_route_table" "tfm_rt_public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfm_igw.id
  }
  tags = {
    Name = "tfm-rt-public"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.tfm_subnet_publica.id
  route_table_id = aws_route_table.tfm_rt_public.id
}

resource "aws_route_table" "tfm_rt_private" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tfm_nat.id
  }
  tags = {
    Name = "tfm-rt-private"
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.tfm_subnet_privada.id
  route_table_id = aws_route_table.tfm_rt_private.id
}

resource "aws_main_route_table_association" "tfm_main_rt_private" {
  vpc_id         = var.vpc_id
  route_table_id = aws_route_table.tfm_rt_private.id
}