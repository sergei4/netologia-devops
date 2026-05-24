output "mysql_cluster_id" {
  value = yandex_mdb_mysql_cluster.netology.id
}

output "mysql_cluster_hosts" {
  value = [
    for host in yandex_mdb_mysql_cluster.netology.host : {
      fqdn = host.fqdn
      zone = host.zone
    }
  ]
}
