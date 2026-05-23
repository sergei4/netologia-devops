resource "yandex_compute_instance_group" "lamp" {
  name               = "${local.name_prefix}-lamp-ig"
  folder_id          = var.folder_id
  service_account_id = yandex_iam_service_account.instance_group.id

  instance_template {
    platform_id = var.instance_platform_id

    resources {
      cores         = var.instance_cores
      memory        = var.instance_memory
      core_fraction = var.instance_core_fraction
    }

    boot_disk {
      mode = "READ_WRITE"

      initialize_params {
        image_id = var.lamp_image_id
        size     = var.boot_disk_size
        type     = "network-hdd"
      }
    }

    network_interface {
      network_id         = yandex_vpc_network.network.id
      subnet_ids         = [yandex_vpc_subnet.public.id]
      security_group_ids = [yandex_vpc_security_group.web.id]
    }

    metadata = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:${local.ssh_public_key}"
      user-data = templatefile("${path.module}/templates/cloud-init.yaml.tftpl", {
        image_url = local.image_url
      })
    }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    fixed_scale {
      size = var.instance_group_size
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
    max_creating    = 1
    max_deleting    = 1
  }

  load_balancer {
    target_group_name        = "${local.name_prefix}-lamp-tg"
    target_group_description = "LAMP target group for homework."
  }

  health_check {
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2

    http_options {
      port = 80
      path = "/index.html"
    }
  }

  depends_on = [
    yandex_resourcemanager_folder_iam_member.compute_editor,
    yandex_resourcemanager_folder_iam_member.load_balancer_editor,
    yandex_storage_object.picture
  ]
}
