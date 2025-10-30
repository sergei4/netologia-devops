variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image"
}

variable "vm_yandex_patform" {
  type        = string
  default     = "standard-v1"
  description = "VM yandex platform"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM platform name"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM db name"
}