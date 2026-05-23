resource "yandex_vpc_network" "network" {
  name = "${local.name_prefix}-${var.network_name}"
}

resource "yandex_vpc_subnet" "public" {
  name           = "${local.name_prefix}-${var.public_subnet_name}"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.public_subnet_cidr
}

resource "yandex_vpc_security_group" "web" {
  name       = "${local.name_prefix}-web-sg"
  network_id = yandex_vpc_network.network.id

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }

  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  egress {
    protocol       = "ANY"
    description    = "All outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
