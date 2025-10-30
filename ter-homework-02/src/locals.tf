locals {
  yandex_platform = "standard-v1"
 
  platform_name = "${var.vm_web_image}-${var.vm_web_name}"
  platform_cores         = 2
  platform_memory        = 1
  platform_core_fraction = 5 
 
  platform_db_name = "${var.vm_web_image}-${var.vm_db_name}"
  platform_db_cores         = 2
  platform_db_memory        = 2
  platform_db_core_fraction = 20 
}