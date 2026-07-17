variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
}

variable "default_zone" {
  description = "Зона доступности по умолчанию"
  type        = string
  default     = "ru-central1-d"
}

variable "service_account_key_file" {
  description = "Путь к авторизованному JSON-ключу сервисного аккаунта terraform-sa"
  type        = string
  default     = "~/yandex_authorized_key.json"
}

variable "bucket_name" {
  description = "Глобально уникальное имя бакета Object Storage для Terraform state"
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Имя бакета должно содержать от 3 до 63 символов."
  }
}

variable "bucket_max_size" {
  description = "Максимальный размер бакета в байтах"
  type        = number
  default     = 1073741824
}