output "state_bucket_name" {
  description = "Имя бакета для удалённого Terraform state"
  value       = yandex_storage_bucket.terraform_state.bucket
}
