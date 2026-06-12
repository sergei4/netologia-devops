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

variable "public_subnets" {
  type = map(object({
    zone = string
    cidr = list(string)
  }))
  default = {
    public-a = {
      zone = "ru-central1-a"
      cidr = ["192.168.10.0/24"]
    }
    public-b = {
      zone = "ru-central1-b"
      cidr = ["192.168.11.0/24"]
    }
    public-d = {
      zone = "ru-central1-d"
      cidr = ["192.168.12.0/24"]
    }
  }
  description = "Public subnets for Kubernetes cluster"
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

variable "k8s_cluster_name" {
  type    = string
  default = "netology-k8s"
}

variable "k8s_node_group_name" {
  type    = string
  default = "netology-k8s-nodes"
}

variable "k8s_cluster_service_account_name" {
  type    = string
  default = "netology-k8s-cluster"
}

variable "k8s_node_service_account_name" {
  type    = string
  default = "netology-k8s-node"
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "Existing KMS key ID for Kubernetes secrets encryption. If empty, a new key will be created."
}
