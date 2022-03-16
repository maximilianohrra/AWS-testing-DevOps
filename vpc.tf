# VPC -> red privada dentro de AWS
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr_block}"

    tags = {
       Name = "wp-pvc-tf"
    }
}

# Internet Gateway -> Para la salida a Internet desde la subnet publica

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"

    tags = {
       Name = "wp-igw-tf"
    }
}

# Subnets :

# Subnet publica 
resource "aws_subnet" "wp-public-tf" {
    vpc_id            = "${aws_vpc.default.id}"
    cidr_block        = "${var.public_subnet_cidr_block}"
    availability_zone = "us-west-1b"

    tags = {
       Name = "wp-public-tf"
    }
}

# Subnet privada
resource "aws_subnet" "wp-private-tf" {
    vpc_id            = "${aws_vpc.default.id}"
    cidr_block        = "${var.private_subnet_cidr_block}"
    availability_zone = "us-west-1c"

    tags = {
       Name = "wp-private-tf"
    }
}

# Route Tables para asociar a las correspondientes subnets

# RT PUBLICA 
resource "aws_route_table" "wp-rt-public-tf" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
       Name = "wp-rt-public-tf"
    }
}

resource "aws_route_table_association" "wp-public-tf" {
    subnet_id = "${aws_subnet.wp-public-tf.id}"
    route_table_id = "${aws_route_table.wp-rt-public-tf.id}"
}

# RT PRIVADA
resource "aws_route_table" "rt-private-tf" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.nat.id}" # todo el trafico que requiera internet va a salir por el nat.
    }

    tags = {
       Name = "wp-rt-private-tf"
    }
}

resource "aws_route_table_association" "wp-private-tf" {
    subnet_id = "${aws_subnet.wp-private-tf.id}"
    route_table_id = "${aws_route_table.rt-private-tf.id}"
}


# ELASTIC IP de aws para asociar a la NAT gw y conectarse a internet
resource "aws_eip" "eip" {
  vpc = true

  associate_with_private_ip = "${aws_subnet.wp-private-tf.id}"
  depends_on                = [aws_internet_gateway.default]
}


# NAT GATEWAY -> Para la salida a Internet desde la subnet publica

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id #Elastic IP
  subnet_id     = "${aws_subnet.wp-public-tf.id}" 

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.default]
}