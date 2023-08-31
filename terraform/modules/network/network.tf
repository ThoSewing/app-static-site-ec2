<<<<<<< HEAD
resource "aws_vpc" "vpc" {
  cidr_block           = var.network_cidr_block
  enable_dns_hostnames = var.network_enable_dns_hostnames
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "sn_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_pub_cidr_block
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  availability_zone       = var.subnet_pub_availability_zone
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rt_public_To_sn_public" {
  subnet_id      = aws_subnet.sn_public.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_security_group" "sg_public" {
  name   = var.sg_public_name
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP/80 from All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

=======
# RESOURCE: VPC

resource "aws_vpc" "vpc" {
    cidr_block           = "${var.vpc_cidr}"
    enable_dns_hostnames = "${var.vpc_dns_hostnames}"
}


# RESOURCE: INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
}


# RESOURCE: SUBNETS

resource "aws_subnet" "sn_pub_az1" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_az1}"
    cidr_block              = "${var.vpc_sn_pub_az1_cidr}"
    map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
}


# RESOURCE: ROUTE TABLES FOR THE SUBNETS

resource "aws_route_table" "rt_pub" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "${var.vpc_cidr_all}"
        gateway_id = aws_internet_gateway.igw.id
    }
}


# RESOURCE: ROUTE TABLES ASSOCIATION TO SUBNETS

resource "aws_route_table_association" "rt_pub_sn_pub_az1" {
  subnet_id      = aws_subnet.sn_pub_az1.id
  route_table_id = aws_route_table.rt_pub.id
}


# RESOURCE: SECURITY GROUPS

resource "aws_security_group" "vpc_sg_pub" {
    vpc_id = aws_vpc.vpc.id
    egress {
        from_port   = "${var.vpc_sg_port_all}"
        to_port     = "${var.vpc_sg_port_all}"
        protocol    = "${var.vpc_sg_protocol_any}"
        cidr_blocks = ["${var.vpc_cidr_all}"]
    }
    ingress {
        from_port   = "${var.vpc_sg_port_all}"
        to_port     = "${var.vpc_sg_port_all}"
        protocol    = "${var.vpc_sg_protocol_any}"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port   = "${var.vpc_sg_port_ssh}"
        to_port     = "${var.vpc_sg_port_ssh}"
        protocol    = "${var.vpc_sg_protocol_tcp}"
        cidr_blocks = ["${var.vpc_cidr_all}"]
    }
    ingress {
        from_port   = "${var.vpc_sg_port_http}"
        to_port     = "${var.vpc_sg_port_http}"
        protocol    = "${var.vpc_sg_protocol_tcp}"
        cidr_blocks = ["${var.vpc_cidr_all}"]
    }
>>>>>>> b07495bdd64f5b8dc372f7ad6fdada84d61b4195
}