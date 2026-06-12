resource "yandex_kubernetes_cluster" "netology" {
  name        = "${var.env}-${var.k8s_cluster_name}"
  description = "Regional Managed Kubernetes cluster for Netology homework"
  network_id  = yandex_vpc_network.network.id

  service_account_id      = yandex_iam_service_account.k8s_cluster.id
  node_service_account_id = yandex_iam_service_account.k8s_node.id

  release_channel = "REGULAR"

  master {
    public_ip = true

    regional {
      region = "ru-central1"

      dynamic "location" {
        for_each = yandex_vpc_subnet.public

        content {
          zone      = location.value.zone
          subnet_id = location.value.id
        }
      }
    }
  }

  kms_provider {
    key_id = local.k8s_kms_key_id
  }

  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s_cluster_agent,
    yandex_resourcemanager_folder_iam_member.k8s_cluster_vpc_public_admin,
    yandex_resourcemanager_folder_iam_member.k8s_node_images_puller,
    yandex_kms_symmetric_key_iam_member.k8s_cluster,
  ]
}

resource "yandex_kubernetes_node_group" "netology" {
  for_each = yandex_vpc_subnet.public

  name        = "${var.env}-${var.k8s_node_group_name}-${each.key}"
  description = "Autoscaled node group for Netology homework in ${each.value.zone}"
  cluster_id  = yandex_kubernetes_cluster.netology.id

  instance_template {
    platform_id = "standard-v3"

    resources {
      cores         = 2
      memory        = 4
      core_fraction = 20
    }

    boot_disk {
      type = "network-ssd"
      size = 64
    }

    network_interface {
      nat        = true
      subnet_ids = [each.value.id]
    }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    auto_scale {
      min     = 1
      max     = 2
      initial = 1
    }
  }

  allocation_policy {
    location {
      zone = each.value.zone
    }
  }

  deploy_policy {
    max_expansion   = 1
    max_unavailable = 1
  }

  maintenance_policy {
    auto_repair  = true
    auto_upgrade = true
  }

  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s_node_images_puller,
  ]
}
