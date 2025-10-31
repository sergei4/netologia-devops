locals {
    yandex_vm_image = "ubuntu-2004-lts"
    yandex_instance_platform_id = "standard-v3"
    ssh_public_key = file("~/.ssh/id_ed25519.pub")
}
