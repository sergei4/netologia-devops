variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID."
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder ID."
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Default availability zone."
}

variable "env" {
  type    = string
  default = "cloud-02"
}

variable "network_name" {
  type    = string
  default = "network"
}

variable "public_subnet_name" {
  type    = string
  default = "public"
}

variable "public_subnet_cidr" {
  type    = list(string)
  default = ["192.168.30.0/24"]
}

variable "service_account_name" {
  type    = string
  default = "cloud-02-ig-sa"
}

variable "bucket_name" {
  type        = string
  default     = ""
  description = "Globally unique bucket name. If empty, bucket_prefix is used."
}

variable "bucket_prefix" {
  type    = string
  default = "netology-cloud-02-"
}

variable "asset_key" {
  type    = string
  default = "netology-cloud.svg"
}

variable "lamp_image_id" {
  type    = string
  default = "fd827b91d99psvq5fjit"
}

variable "instance_group_size" {
  type    = number
  default = 3
}

variable "instance_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "instance_cores" {
  type    = number
  default = 2
}

variable "instance_memory" {
  type    = number
  default = 2
}

variable "instance_core_fraction" {
  type    = number
  default = 20
}

variable "boot_disk_size" {
  type    = number
  default = 10
}
