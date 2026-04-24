resource "yandex_vpc_network" "network" {
  name = "${var.env}-${var.vpc_name}"
}

resource "yandex_vpc_subnet" "public" {
  name           = var.public_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.public_subnet_cidr
}

resource "yandex_vpc_subnet" "private" {
  name           = var.private_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.private_subnet_cidr

  route_table_id = yandex_vpc_route_table.private_rt.id
}

resource "yandex_vpc_route_table" "private_rt" {
  name       = var.private_subnet_route_table_name
  network_id = yandex_vpc_network.network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_address
  }
}

resource "yandex_vpc_security_group" "security_group" {
  name       = "${var.env}-security_group"
  network_id = yandex_vpc_network.network.id

  ingress {
    protocol       = "TCP"
    description    = "SSH from internet"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "ANY"
    description    = "Internal traffic from public subnet"
    v4_cidr_blocks = var.public_subnet_cidr
  }

  ingress {
    protocol       = "ANY"
    description    = "Internal traffic from private subnet"
    v4_cidr_blocks = var.private_subnet_cidr
  }

  egress {
    protocol       = "ANY"
    description    = "All outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}