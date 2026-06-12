locals {
  k8s_kms_key_id = var.kms_key_id != "" ? var.kms_key_id : yandex_kms_symmetric_key.k8s[0].id
}

resource "yandex_kms_symmetric_key" "k8s" {
  count = var.kms_key_id == "" ? 1 : 0

  name              = "${var.env}-k8s-kms-key"
  description       = "KMS key for Managed Kubernetes secrets encryption"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"
}

resource "yandex_kms_symmetric_key_iam_member" "k8s_cluster" {
  symmetric_key_id = local.k8s_kms_key_id
  role             = "kms.keys.encrypterDecrypter"
  member           = "serviceAccount:${yandex_iam_service_account.k8s_cluster.id}"

  sleep_after = 30
}
