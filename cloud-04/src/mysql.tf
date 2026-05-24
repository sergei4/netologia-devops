resource "yandex_mdb_mysql_cluster" "netology" {
  name                = "${var.env}-${var.mysql_cluster_name}"
  environment         = "PRESTABLE"
  network_id          = yandex_vpc_network.network.id
  version             = "8.0"
  security_group_ids  = [yandex_vpc_security_group.mysql.id]
  deletion_protection = true

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  backup_window_start {
    hours   = 23
    minutes = 59
  }

  maintenance_window {
    type = "ANYTIME"
  }

  dynamic "host" {
    for_each = yandex_vpc_subnet.private

    content {
      zone      = host.value.zone
      subnet_id = host.value.id
    }
  }
}

resource "yandex_mdb_mysql_database" "netology" {
  cluster_id = yandex_mdb_mysql_cluster.netology.id
  name       = var.mysql_database_name
}

resource "yandex_mdb_mysql_user" "netology" {
  cluster_id = yandex_mdb_mysql_cluster.netology.id
  name       = var.mysql_user_name
  password   = var.mysql_user_password

  permission {
    database_name = yandex_mdb_mysql_database.netology.name
    roles         = ["ALL"]
  }
}
