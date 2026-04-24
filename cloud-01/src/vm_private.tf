resource "yandex_compute_instance" "private" {

  name        = "${var.env}-private"
  platform_id = local.yandex_instance_platform_id

  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
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
    subnet_id = yandex_vpc_subnet.private.id
    security_group_ids = [yandex_vpc_security_group.security_group.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }

}
