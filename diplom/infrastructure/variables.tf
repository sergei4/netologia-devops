variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud для дипломного проекта"
  type        = string
}

variable "default_zone" {
  description = "Зона доступности по умолчанию для провайдера"
  type        = string
  default     = "ru-central1-d"
}

variable "service_account_key_file" {
  description = "Путь к авторизованному JSON-ключу сервисного аккаунта terraform-sa"
  type        = string
  default     = "~/yandex_authorized_key.json"
}

variable "env" {
  description = "Название окружения"
  type        = string
  default     = "demo"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{1,61}[a-z0-9]$", var.env))
    error_message = "environment должен содержать 3–63 символа: строчные латинские буквы, цифры и дефисы."
  }
}

variable "network_name" {
  description = "Имя облачной сети VPC"
  type        = string
  default     = "diploma-network"
}

variable "subnets" {
  description = "Подсети: ключ, зона доступности и список IPv4 CIDR"
  type = map(object({
    zone           = string
    v4_cidr_blocks = list(string)
  }))

  default = {
    a = {
      zone           = "ru-central1-a"
      v4_cidr_blocks = ["10.10.1.0/24"]
    }
    b = {
      zone           = "ru-central1-b"
      v4_cidr_blocks = ["10.10.2.0/24"]
    }
    d = {
      zone           = "ru-central1-d"
      v4_cidr_blocks = ["10.10.3.0/24"]
    }
  }
}
