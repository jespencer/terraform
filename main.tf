provider "libvirt" {
  uri = "qemu:///system"
}
resource "libvirt_volume" "centos-qcow2" {
  name = "git.qcow2"
  pool = "vms"
  format = "qcow2"
  source = "/storage/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}


data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  user_data          = "${data.template_file.user_data.rendered}"
  pool = "vms"
}


#create the machine
resource "libvirt_domain" "domain-git" {
  count = "2"
  name = "git-${count.index}"
  memory = "1024"
  vcpu = 1


network_interface {
   wait_for_lease = false
   bridge = "br0"
} 
#  count = 1

cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
      type        = "pty"
      target_type = "virtio"
      target_port = "1"
  }


  disk {
       volume_id = "${libvirt_volume.centos-qcow2.id}"
  }
}

