locals {
  name_prefix    = var.env
  image_path     = "${path.module}/../assets/netology-cloud.svg"
  image_url      = "https://storage.yandexcloud.net/${yandex_storage_bucket.assets.bucket}/${yandex_storage_object.picture.key}"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCu5sE0D+wBTz4A6pfkzRaQHTuwyEcbU4kFmK2EkY2C5vjYXIRGMCEHBreFX+S+Ha6nSwr+fkqnH2wS2tdCadW8C2EJed/q2Qopj3QDyjWv4uaqXAE306fpVF2VxQIVNOHb+StKUU3ZNtZmjO1laDQYpuLty9zjT4vbzIY9rBw2kRoeh5qmeMCRraCdq8YLm8REDvtmH7MPOb/ItgaKTKCcnFb9vXgaceBEDPQAzJf9ZiqXe4EzbKNtfL8aowy+TB6ontWoAvNXFp2UTZHXB/b9kcUT5FB8MqtZUIXFiOTrrCI/HnOqEZ823u822dN7eKTv7U+tU1gPoTQ6dqnc5L9j"
}
