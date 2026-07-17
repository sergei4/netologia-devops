resource "yandex_storage_bucket" "terraform_state" {
  folder_id = var.folder_id
  bucket    = var.bucket_name
  max_size  = var.bucket_max_size

  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}