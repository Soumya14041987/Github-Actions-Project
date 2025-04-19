resource "aws_vpc" "githubactions-project-vpc" {
  cidr_block = var.aws_vpc
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "github-actions-vpc"
  }
}

resource "aws_subnet" "githubactions-project-subnet" {
  vpc_id                  = aws_vpc.githubactions-project-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "githubactions-project-subnet"
  }
}

resource "aws_internet_gateway" "githubactions-project-igw" {
  vpc_id = aws_vpc.githubactions-project-vpc.id
  tags = {
    Name = "githubactions-project-igw"
  }
}

resource "aws_route_table" "githubactions-project-route-table" {
  vpc_id = aws_vpc.githubactions-project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.githubactions-project-igw.id
  }
  tags = {
    Name = "githubactions-project-route-table"
  }
}

resource "aws_route_table_association" "githubactions-project-route-table-association" {
  subnet_id      = aws_subnet.githubactions-project-subnet.id
  route_table_id = aws_route_table.githubactions-project-route-table.id
}

resource "aws_security_group" "githubactions-project-sg" {
  name        = "githubactions-project-sg"
  description = "Allow inbound traffic on port 8080, 22, and 80"
  vpc_id      = aws_vpc.githubactions-project-vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 587
    to_port     = 587
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  ingress {
    from_port   = 3000 
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
    from_port   = 465
    to_port     = 465
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
    from_port   = 11000 
    to_port     = 11000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }     

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "githubactions-project" {
  ami                      = var.ami
  instance_type            = var.instance_type
  key_name                 = var.aws_key_name
  subnet_id                = aws_subnet.githubactions-project-subnet.id
  vpc_security_group_ids   = [aws_security_group.githubactions-project-sg.id]
  associate_public_ip_address = true
  

  tags = {
    Name = "Githubactions-project"
  }

}