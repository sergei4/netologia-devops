###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "env" {
  type        = string
  default     = "develop"
}

variable "vpc_name" {
  type        = string
  default     = "network"
  description = "VPC network & subnet name" 
}

variable "public_subnet_name" {
  type        = string
  default     = "public"
}

variable "public_subnet_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "private_subnet_name" {
  type        = string
  default     = "private"
}

variable "private_subnet_cidr" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "nat_address" {
  type = string
  default = "192.168.10.254"
}

variable "private_subnet_route_table_name" {
  type        = string
  default     = "private-route-table"
}