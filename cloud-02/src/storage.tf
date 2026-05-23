resource "yandex_storage_bucket" "assets" {
  access_key = yandex_iam_service_account_static_access_key.storage.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage.secret_key

  bucket        = var.bucket_name != "" ? var.bucket_name : null
  bucket_prefix = var.bucket_name == "" ? var.bucket_prefix : null

  default_storage_class = "STANDARD"

  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }
}

resource "yandex_storage_object" "picture" {
  access_key = yandex_iam_service_account_static_access_key.storage.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage.secret_key

  bucket       = yandex_storage_bucket.assets.bucket
  key          = var.asset_key
  source       = local.image_path
  content_type = "image/svg+xml"
  acl          = "public-read"
}
