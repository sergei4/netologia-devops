resource "yandex_iam_service_account" "k8s_cluster" {
  name        = "${var.env}-${var.k8s_cluster_service_account_name}"
  description = "Service account for Managed Kubernetes control plane"
}

resource "yandex_iam_service_account" "k8s_node" {
  name        = "${var.env}-${var.k8s_node_service_account_name}"
  description = "Service account for Managed Kubernetes nodes"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_cluster_agent" {
  folder_id = var.folder_id
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_cluster.id}"

  sleep_after = 30
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_cluster_vpc_public_admin" {
  folder_id = var.folder_id
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_cluster.id}"

  sleep_after = 30
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_node_images_puller" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_node.id}"

  sleep_after = 30
}
