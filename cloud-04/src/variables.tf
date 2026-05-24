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
  type    = string
  default = "develop"
}

variable "vpc_name" {
  type        = string
  default     = "network"
  description = "VPC network & subnet name"
}

variable "private_subnets" {
  type = map(object({
    zone = string
    cidr = list(string)
  }))
  default = {
    private-a = {
      zone = "ru-central1-a"
      cidr = ["192.168.20.0/24"]
    }
    private-b = {
      zone = "ru-central1-b"
      cidr = ["192.168.30.0/24"]
    }
  }
  description = "Private subnets for MySQL cluster hosts"
}

variable "mysql_cluster_name" {
  type    = string
  default = "netology-mysql"
}

variable "mysql_database_name" {
  type    = string
  default = "netology_db"
}

variable "mysql_user_name" {
  type    = string
  default = "netology"
}

variable "mysql_user_password" {
  type        = string
  sensitive   = true
  description = "Password for MySQL user. Must be 8-128 characters."
}
