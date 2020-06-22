provider "aws" {
  profile = "bizzbank"
  region  = "ap-south-1"
}

##VPC Setup

resource "aws_vpc" "bizzbank_uat" {
  cidr_block          = "${var.bizz_vpc}"
  enable_dns_support  = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

### VPC NACL setup
resource "aws_network_acl" "bizzbank_uat_NACL" {
  vpc_id = "${aws_vpc.bizzbank_uat.id}"
  subnet_ids = [ "${aws_subnet.bizzbank_elb_pub1.id}", "${aws_subnet.bizzbank_elb_pub2.id}", "${aws_subnet.bizzbank_web_priv1.id}", "${aws_subnet.bizzbank_web_priv2.id}", "${aws_subnet.bizzbank_app_priv1.id}", "${aws_subnet.bizzbank_app_priv2.id}", "${aws_subnet.bizzbank_db_priv1.id}", "${aws_subnet.bizzbank_db_priv2.id}"  ]

### allow ingress port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 22
    to_port    = 22
  }

### allow ingress port 80
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 80
    to_port    = 80
  }

### allow ingress port 443
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 443
    to_port    = 443
  }

### allow ingress ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 1024
    to_port    = 65535
  }

### allow egress port 22
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 22
    to_port    = 22
  }

### allow egress port 80
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 80
    to_port    = 80
  }


### allow egress port 443
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 443
    to_port    = 443
  }

### allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "${var.opencidr}"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }

}

## VPC Public Subnet ELB AZ1

resource "aws_subnet" "bizzbank_elb_pub1" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_elb_pub1}"
  availability_zone = "${var.bizz_az1}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}


## VPC Public Subnet ELB AZ2

resource "aws_subnet" "bizzbank_elb_pub2" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_elb_pub2}"
  availability_zone = "${var.bizz_az2}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## VPC Private Subnet Web AZ1

resource "aws_subnet" "bizzbank_web_priv1" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_web_priv1}"
  availability_zone = "${var.bizz_az1}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## VPC Private Subnet Web AZ2

resource "aws_subnet" "bizzbank_web_priv2" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_web_priv2}"
  availability_zone = "${var.bizz_az2}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## VPC Private Subnet APP AZ1

resource "aws_subnet" "bizzbank_app_priv1" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_app_priv1}"
  availability_zone = "${var.bizz_az1}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## VPC Private Subnet APP AZ2

resource "aws_subnet" "bizzbank_app_priv2" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_app_priv2}"
  availability_zone = "${var.bizz_az2}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## VPC Private Subnet DB AZ1

resource "aws_subnet" "bizzbank_db_priv1" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_db_priv1}"
  availability_zone = "${var.bizz_az1}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## VPC Private Subnet DB AZ2

resource "aws_subnet" "bizzbank_db_priv2" {
  vpc_id            = "${aws_vpc.bizzbank_uat.id}"
  cidr_block        = "${var.bizz_subnet_db_priv2}"
  availability_zone = "${var.bizz_az2}"

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## Internet Gateway

resource "aws_internet_gateway" "bizzbank_igw" {
  vpc_id = "${aws_vpc.bizzbank_uat.id}"

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

## Elastic IP And NIC

resource "aws_network_interface" "bizzbank_eip" {
  subnet_id   = "${aws_subnet.bizzbank_elb_pub1.id}"
  private_ips = ["${var.privateip}"]

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

resource "aws_eip" "bizzbank_natip" {
  vpc                       = true
  network_interface         = "${aws_network_interface.bizzbank_eip.id}"
  associate_with_private_ip = "${var.privateip}"

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

### Create NatGateway

resource "aws_nat_gateway" "bizzbank_ngw" {
  allocation_id = "${aws_eip.bizzbank_natip.id}"
  subnet_id     = "${aws_subnet.bizzbank_elb_pub1.id}"
  depends_on    = ["aws_internet_gateway.bizzbank_igw"]

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

### Create Route Table Public

resource "aws_route_table" "bizzbank_public_rt" {
  vpc_id = "${aws_vpc.bizzbank_uat.id}"

  route {
    cidr_block = "${var.bizz_vpc_cidr_pub_rt}"
    gateway_id = "${aws_internet_gateway.bizzbank_igw.id}"
  }

  route {
    cidr_block = "${var.bizz_pub_cidr_all_rt}"
    gateway_id = "${aws_internet_gateway.bizzbank_igw.id}"
  }

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

### Create Route Table Private

resource "aws_route_table" "bizzbank_private_rt" {

  vpc_id = "${aws_vpc.bizzbank_uat.id}"

   route {
    cidr_block = "${var.bizz_vpc_cidr_pri_rt}"
    gateway_id = "${aws_nat_gateway.bizzbank_ngw.id}"
  }

  route {
    cidr_block = "${var.bizz_pri_cidr_all_rt}"
    gateway_id = "${aws_nat_gateway.bizzbank_ngw.id}"
  }

  tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

### Route table Association

resource "aws_route_table_association" "bizz_rta_pri1" {
  subnet_id      = "${aws_subnet.bizzbank_app_priv1.id}"
  route_table_id = "${aws_route_table.bizzbank_private_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pri2" {
  subnet_id      = "${aws_subnet.bizzbank_app_priv2.id}"
  route_table_id = "${aws_route_table.bizzbank_private_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pri3" {
  subnet_id      = "${aws_subnet.bizzbank_web_priv1.id}"
  route_table_id = "${aws_route_table.bizzbank_private_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pri4" {
  subnet_id      = "${aws_subnet.bizzbank_web_priv2.id}"
  route_table_id = "${aws_route_table.bizzbank_private_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pri5" {
  subnet_id      = "${aws_subnet.bizzbank_db_priv1.id}"
  route_table_id = "${aws_route_table.bizzbank_private_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pri6" {
  subnet_id      = "${aws_subnet.bizzbank_db_priv1.id}"
  route_table_id = "${aws_route_table.bizzbank_private_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pub1" {
  subnet_id      = "${aws_subnet.bizzbank_elb_pub1.id}"
  route_table_id = "${aws_route_table.bizzbank_public_rt.id}"
}

resource "aws_route_table_association" "bizz_rta_pub2" {
  subnet_id      = "${aws_subnet.bizzbank_elb_pub2.id}"
  route_table_id = "${aws_route_table.bizzbank_public_rt.id}"
}

### Security Group

resource "aws_security_group" "bizzbank_ssh_sg" {
  vpc_id = "${aws_vpc.bizzbank_uat.id}"

  ingress {
    description = "SSH access to Server from OpenVPN"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["3.6.18.48/32"]
   }

   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}

### HTTP Security group

resource "aws_security_group" "bizzbank_web_sg" {
  vpc_id = "${aws_vpc.bizzbank_uat.id}"

  ingress {
    description = "HTTP access to ServerLB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
    Name        = "${var.name}"
    Owner       = "${var.owner}"
    Managedby   = "${var.manage}"
    Environment = "${var.environment}"
    Auto_Stop   = "${var.stop}"
    Auto_Start  = "${var.start}"
  }
}
