
provider "proxmox" {
  pm_api_url = "https://192.168.0.17:8006/api2/json"
  pm_user    = "root@pam"
  pm_password = "Deva#1998"
  insecure = true  # set to true if self-signed certs
}

resource "proxmox_vm_qemu" "ubuntu" {
  name        = "ubuntu-vm"
  target_node = "proxmox-node"

  clone = "SQPSServer" # must already exist

  cores = 2
  memory = 2048
  sockets = 1
  disk_gb = 20

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  os_type = "cloud-init"
  ciuser  = "ubuntu"
  sshkeys = file("~/.ssh/id_rsa.pub")
}
