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

output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.netology.id
}

output "k8s_external_endpoint" {
  value = yandex_kubernetes_cluster.netology.master[0].external_v4_endpoint
}

output "k8s_node_group_ids" {
  value = {
    for name, group in yandex_kubernetes_node_group.netology : name => group.id
  }
}

output "k8s_get_credentials_command" {
  value = "yc managed-kubernetes cluster get-credentials --id ${yandex_kubernetes_cluster.netology.id} --external --force"
}
