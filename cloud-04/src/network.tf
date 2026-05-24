resource "yandex_vpc_network" "network" {
  name = "${var.env}-${var.vpc_name}"
}

resource "yandex_vpc_subnet" "private" {
  for_each = var.private_subnets

  name           = each.key
  zone           = each.value.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = each.value.cidr
}

resource "yandex_vpc_security_group" "mysql" {
  name       = "${var.env}-mysql-sg"
  network_id = yandex_vpc_network.network.id

  ingress {
    protocol       = "TCP"
    description    = "MySQL from private subnets"
    v4_cidr_blocks = flatten([for subnet in var.private_subnets : subnet.cidr])
    port           = 3306
  }

  egress {
    protocol       = "ANY"
    description    = "All outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
