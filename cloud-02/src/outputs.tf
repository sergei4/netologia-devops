output "bucket_name" {
  value = yandex_storage_bucket.assets.bucket
}

output "folder_id" {
  value = var.folder_id
}

output "picture_url" {
  value = local.image_url
}

output "load_balancer_ip" {
  value = yandex_vpc_address.lb.external_ipv4_address[0].address
}

output "load_balancer_id" {
  value = yandex_lb_network_load_balancer.web.id
}

output "target_group_id" {
  value = yandex_compute_instance_group.lamp.load_balancer[0].target_group_id
}

output "site_url" {
  value = "http://${yandex_vpc_address.lb.external_ipv4_address[0].address}"
}
