# Define VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnets" {
  count            = 3
  vpc_id           = aws_vpc.my_vpc.id
  cidr_block       = var.subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true
}


resource "aws_subnet" "private_subnets" {
  count            = 1
  vpc_id           = aws_vpc.my_vpc.id
  cidr_block       = var.subnet_cidr_blocks[3] # Use the third CIDR block for private subnet
  availability_zone = "ap-south-1b"
}


resource "aws_instance" "public_instances" {
  count         = 3

  ami             = var.ami_id
  instance_type   = var.instance_types[count.index]
  subnet_id       = aws_subnet.public_subnets[count.index].id
    tags = {
    Name = "public_instances-${count.index + 1}"
  }
}

resource "aws_instance" "private_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_types[3] # Use a different instance type for the private instance
  subnet_id       = aws_subnet.private_subnets[0].id
    tags = {
    Name = "private_instance"
  }
}


resource "aws_iam_user" "my_user" {
  name = "my-iam-user_created_by_tf"
}



resource "aws_iam_access_key" "my_user_access_key" {
  user = aws_iam_user.my_user.name
}
