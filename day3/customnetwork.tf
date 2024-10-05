resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "mahin"
  }
}

resource "aws_internet_gateway" "cust" {
  vpc_id = aws_vpc.cust.id
  tags = {
    name= "my-igw"
  }
}

resource "aws_subnet" "cust" {
  vpc_id = aws_vpc.cust.id
  cidr_block = "10.0.1.0/24"
  tags = {
    name = "pub-sub1"
  }
}

resource "aws_route_table" "cust" {
  vpc_id = aws_vpc.cust.id

  route {
    gateway_id = aws_internet_gateway.cust.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "MyCustomRouteTable"
  }
}


resource "aws_route_table_association" "cust" {
    route_table_id = aws_route_table.cust.id
    subnet_id = aws_subnet.cust.id

}

resource "aws_security_group" "allows_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.cust.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    ipv6_cidr_blocks = []  # Set to empty if not using IPv6
    security_groups = []   # Set to empty if no security groups are referenced
    prefix_list_ids = []   # Set to empty if not using prefix lists
  }

  tags = {
    Name = "allow_tls"
  }
}

  resource "aws_security_group" "allows_tls2" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []    # Add this to handle the requirement for IPv6
      prefix_list_ids  = []    # Add this to handle prefix list ids
      description      = ""
      from_port        = 0
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
}




 


