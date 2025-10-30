###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1ghgic2icg2c683g4fb"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1ga36a34a38dre8etoa"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "secondary_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "subnet1_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnet1_name" {
  type        = string
  default     = "develop"
  description = "subnet1 name"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "subnet2_name" {
  type        = string
  default     = "subnet2"
  description = "subnet2 name"
}

variable "subnet2_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBvAQlvE7LIJDwjb1Wu9s9tEKZQWMdCHQthfB14QI7wq root@homebox"
#   description = "ssh-keygen -t ed25519"
# }

variable "vms_resources" {
type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
}

variable "vms_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys = string
  }))
  default = {
    default = {
        serial-port-enable = 1
        ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBvAQlvE7LIJDwjb1Wu9s9tEKZQWMdCHQthfB14QI7wq root@homebox"
    }
  }
}
