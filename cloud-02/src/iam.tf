resource "yandex_iam_service_account" "instance_group" {
  name        = var.service_account_name
  description = "Service account for cloud-02 instance group, NLB and Object Storage."
}

resource "yandex_resourcemanager_folder_iam_member" "compute_editor" {
  folder_id = var.folder_id
  role      = "compute.editor"
  member    = "serviceAccount:${yandex_iam_service_account.instance_group.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "load_balancer_editor" {
  folder_id = var.folder_id
  role      = "load-balancer.editor"
  member    = "serviceAccount:${yandex_iam_service_account.instance_group.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "storage_admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.instance_group.id}"
}

resource "yandex_iam_service_account_static_access_key" "storage" {
  service_account_id = yandex_iam_service_account.instance_group.id
  description        = "Static access key for Object Storage bucket provisioning."

  depends_on = [
    yandex_resourcemanager_folder_iam_member.storage_admin
  ]
}
