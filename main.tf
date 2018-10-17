//connect to local machine libvirt
provider "libvirt" {
  uri = "qemu:///system"
}

//remotehost
//provider "libvirt" {
//  alias = "remotehost"
//  uri   = "qemu+ssh://root@hyper/system"
//}

//create volumes
resource "libvirt_volume" "splunklab-ds" {
  name = "splunklab-ds.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-sh1" {
  name = "splunklab-sh1.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-sh2" {
  name = "splunklab-sh2.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-sh3" {
  name = "splunklab-sh3.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-idx1" {
  name = "splunklab-idx1.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-idx2" {
  name = "splunklab-idx2.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-idx3" {
  name = "splunklab-idx3.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}

resource "libvirt_volume" "splunklab-mn" {
  name = "splunklab-mn.qcow2"
  pool = "default"
  format = "qcow2"
  source = "/var/lib/libvirt/images/iso/CentOS-7-x86_64-GenericCloud-1808.qcow2"
}


//defaults for all machines
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

//defaults for all machines
resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  user_data          = "${data.template_file.user_data.rendered}"
  pool = "default"
}


//splunklab-ds
resource "libvirt_domain" "splunklab-ds" {
  name = "splunklab-ds"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
} 

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
       volume_id = "${libvirt_volume.splunklab-ds.id}"
  }
}

//splunklab-sh1
resource "libvirt_domain" "splunklab-sh1" {
  name = "splunklab-sh1"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-sh1.id}"
  }
}
//splunklab-sh2
resource "libvirt_domain" "splunklab-sh2" {
  name = "splunklab-sh2"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-sh2.id}"
  }
}
//splunklab-sh3
resource "libvirt_domain" "splunklab-sh3" {
  name = "splunklab-sh3"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-sh3.id}"
  }
}
//splunklab-idx1
resource "libvirt_domain" "splunklab-idx1" {
  name = "splunklab-idx1"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-idx1.id}"
  }
}
//splunklab-idx2
resource "libvirt_domain" "splunklab-idx2" {
  name = "splunklab-idx2"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-idx2.id}"
  }
}
//splunklab-idx3
resource "libvirt_domain" "splunklab-idx3" {
  name = "splunklab-idx3"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-idx3.id}"
  }
}
//splunklab-mn
resource "libvirt_domain" "splunklab-mn" {
  name = "splunklab-mn"
  memory = "1024"


network_interface {
   wait_for_lease = false
   bridge = "br0"
}

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
       volume_id = "${libvirt_volume.splunklab-mn.id}"
  }
}

