# Internet Gateway
resource "aws_internet_gateway" "tfm_igw" {
  vpc_id = var.vpc_id
  tags = { Name = "tfm-igw" }
}

# EIPs para los NAT Gateways (uno por AZ)
resource "aws_eip" "nat_eip_1" {
  tags = { Name = "tfm-nat-eip-1" }
}

resource "aws_eip" "nat_eip_2" {
  tags = { Name = "tfm-nat-eip-2" }
}

# Subredes Públicas
resource "aws_subnet" "tfm_subnet_publica_1" {
  vpc_id                  = var.vpc_id
  cidr_block               = "10.0.1.0/24"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = true
  tags = { Name = "tfm-subred-publica-1" }
}

resource "aws_subnet" "tfm_subnet_publica_2" {
  vpc_id                  = var.vpc_id
  cidr_block               = "10.0.2.0/24"
  availability_zone        = "us-east-1b"
  map_public_ip_on_launch  = true
  tags = { Name = "tfm-subred-publica-2" }
}

# Subredes Privadas
resource "aws_subnet" "tfm_subnet_privada_1" {
  vpc_id           = var.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "tfm-subred-privada-1" }
}

resource "aws_subnet" "tfm_subnet_privada_2" {
  vpc_id           = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "tfm-subred-privada-2" }
}

# NAT Gateways
resource "aws_nat_gateway" "tfm_nat_1" {
  allocation_id = aws_eip.nat_eip_1.id
  subnet_id     = aws_subnet.tfm_subnet_publica_1.id
  tags = { Name = "tfm-nat-1" }
}

resource "aws_nat_gateway" "tfm_nat_2" {
  allocation_id = aws_eip.nat_eip_2.id
  subnet_id     = aws_subnet.tfm_subnet_publica_2.id
  tags = { Name = "tfm-nat-2" }
}

# Route Table Pública
resource "aws_route_table" "tfm_rt_public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfm_igw.id
  }
  tags = { Name = "tfm-rt-public" }
}

# Asociación a Subredes Públicas
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.tfm_subnet_publica_1.id
  route_table_id = aws_route_table.tfm_rt_public.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.tfm_subnet_publica_2.id
  route_table_id = aws_route_table.tfm_rt_public.id
}

# Route Table Privada 1 (us-east-1a)
resource "aws_route_table" "tfm_rt_private_1" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tfm_nat_1.id
  }
  tags = { Name = "tfm-rt-private-1" }
}

resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.tfm_subnet_privada_1.id
  route_table_id = aws_route_table.tfm_rt_private_1.id
}

# Route Table Privada 2 (us-east-1b)
resource "aws_route_table" "tfm_rt_private_2" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tfm_nat_2.id
  }
  tags = { Name = "tfm-rt-private-2" }
}

resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.tfm_subnet_privada_2.id
  route_table_id = aws_route_table.tfm_rt_private_2.id
}