data "yandex_compute_image" "ubuntu" {
  family = local.yandex_vm_image
}