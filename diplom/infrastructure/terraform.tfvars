service_account_key_file = "~/.config/yandex-cloud/keys/terraform-sa-key.json"

cloud_id = "b1gihu82d9h8r313j7a5"

folder_id = "b1grb9s66nkombj03chh"

env  = "develop"

network_name = "network"

subnets = {
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
