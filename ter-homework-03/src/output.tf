output "servers" {
  value = values({ for x, i in merge(
    { for idx, instance in yandex_compute_instance.web : "web_${idx}" => instance },
    { for idx, instance in yandex_compute_instance.db : "db_${idx}" => instance }
  ) : i.name => {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }
  })
}
