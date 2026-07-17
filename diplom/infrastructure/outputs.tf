output "network_id" {
  description = "ID созданной облачной сети"
  value       = yandex_vpc_network.network.id
}

output "network_name" {
  description = "Имя созданной облачной сети"
  value       = yandex_vpc_network.network.name
}

output "default_security_group_id" {
  description = "ID группы безопасности по умолчанию для созданной сети"
  value       = yandex_vpc_network.network.default_security_group_id
}

output "subnet_ids" {
  description = "ID подсетей по их ключам"
  value = {
    for key, subnet in yandex_vpc_subnet.network_subnet : key => subnet.id
  }
}

output "subnets" {
  description = "Параметры созданных подсетей для использования на следующих этапах"
  value = {
    for key, subnet in yandex_vpc_subnet.network_subnet : key => {
      id             = subnet.id
      name           = subnet.name
      zone           = subnet.zone
      v4_cidr_blocks = subnet.v4_cidr_blocks
    }
  }
}
