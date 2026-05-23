resource "yandex_vpc_address" "lb" {
  name = "${local.name_prefix}-nlb-ip"

  external_ipv4_address {
    zone_id = var.default_zone
  }
}

resource "yandex_lb_network_load_balancer" "web" {
  name = "${local.name_prefix}-nlb"

  listener {
    name        = "${local.name_prefix}-http-listener"
    port        = 80
    target_port = 80

    external_address_spec {
      address    = yandex_vpc_address.lb.external_ipv4_address[0].address
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp.load_balancer[0].target_group_id

    healthcheck {
      name                = "http"
      interval            = 10
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2

      http_options {
        port = 80
        path = "/index.html"
      }
    }
  }
}
