resource "aws_vpc" "main" {
  cidr_block           = "192.168.0.0/25"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.0.0/26"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.0.64/26"
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_db_subnet_group" "main" {
  name        = "my-db-subnet-group"
  subnet_ids  = aws_subnet.private.*.id
  description = "my db subnet group"

}
