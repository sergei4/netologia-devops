resource "yandex_compute_disk" "storage_disks" {
  count = 3

  name     = "storage-disk-${count.index + 1}"
  type     = "network-hdd"
  size     = 10
  block_size = 4096
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
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
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disks
    content {
        disk_id = lookup(secondary_disk.value, "id", null)
    }
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }

}
