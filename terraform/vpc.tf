resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public.id
}



resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/18"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}
resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              =  "10.0.64.0/18"
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.128.0/18"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_db_subnet_group" "main" {
  name        = "my-db-subnet-group"
  subnet_ids  = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  description = "my db subnet group"

}