output "test" {

  value = [
    { platform = [
        "instance=${yandex_compute_instance.platform.name}", 
        "external_ip=${yandex_compute_instance.platform.network_interface[0].nat_ip_address}",
        "fqdn=${yandex_compute_instance.platform.fqdn}"
        ]
    },
    { platform-db = [
        "instance=${yandex_compute_instance.platform-db.name}", 
        "external_ip=${yandex_compute_instance.platform-db.network_interface[0].nat_ip_address}",
        "fqdn=${yandex_compute_instance.platform-db.fqdn}"
        ]
    }
  ]
}