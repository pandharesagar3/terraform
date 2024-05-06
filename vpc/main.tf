resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

# Create public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "your_az"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "InternetGateway"
  }
}

# Attach internet gateway to VPC
resource "aws_vpc_attachment" "gw_attachment" {
  vpc_id       = aws_vpc.main.id
  internet_gateway_id = aws_internet_gateway.gw.id
}
