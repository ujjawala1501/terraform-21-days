resource "aws_vpc" "namesamplevpc" {
    cidr_block = "10.0.0.0/16"
  
    tags ={
        Name = "VPCsample"
    }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.namesamplevpc.id  #extract the id from above block 
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a" # if we add this later after creating the vpc it will require to destroy the existing vpc and create new one.

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.namesamplevpc.id  #extract the id from above block 
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a" # if we add this later after creating the vpc it will require to destroy the existing vpc and create new one.

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.namesamplevpc.id  #extract the id from above block 
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b" # if we add this later after creating the vpc it will require to destroy the existing vpc and create new one.

  tags = {
    Name = "public2"
  }
}
resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.namesamplevpc.id  #extract the id from above block 
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b" # if we add this later after creating the vpc it will require to destroy the existing vpc and create new one.

  tags = {
    Name = "public3"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.namesamplevpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "ex_rt_tbl" {
  vpc_id = aws_vpc.namesamplevpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "ex_rt_tbl"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.ex_rt_tbl.id
}
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.ex_rt_tbl.id
}