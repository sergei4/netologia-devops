resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.subnet1_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet1_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}

resource "yandex_compute_instance" "platform" {
  name        = local.platform_name
  platform_id = local.yandex_platform

  allow_stopping_for_update = true

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.default.serial-port-enable
    ssh-keys           = var.vms_metadata.default.ssh-keys
  }

}

resource "yandex_vpc_subnet" "subnet2" {
  name           = var.subnet2_name
  zone           = var.secondary_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet2_cidr
}

resource "yandex_compute_instance" "platform-db" {
  name        = local.platform_db_name
  zone        = var.secondary_zone
  platform_id = local.yandex_platform
  
  allow_stopping_for_update = true
  
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet2.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.default.serial-port-enable
    ssh-keys           = var.vms_metadata.default.ssh-keys
  }

}
