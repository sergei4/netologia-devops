locals {
  common_labels = {
    environment = var.env
    managed-by  = "terraform"
    project     = "netology-diploma"
  }
}

resource "yandex_vpc_network" "network" {
  folder_id   = var.folder_id
  name        = "${var.env}-${var.network_name}"
  description = "VPC for the Netology DevOps diploma project"
  labels      = local.common_labels
}

resource "yandex_vpc_subnet" "network_subnet" {
  for_each = var.subnets

  folder_id      = var.folder_id
  name           = "${var.env}-subnet-${each.key}"
  description    = "Subnet ${each.key} for the Netology DevOps diploma project"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = each.value.v4_cidr_blocks
  labels         = local.common_labels
}
