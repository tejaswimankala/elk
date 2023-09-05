resource "google_compute_firewall" "myfirewall-metric" {
  name    = "${var.elk-firewall}"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "7000", "9042", "5601"]
  }
   source_ranges = ["0.0.0.0/0"]
}

// CREATE INSTANCE IN ABOVE VPC with firewall ATTACHED
resource "google_compute_instance" "myinstance-m" {
  //name         = "vm-centos7-2"
  #count        = "${var.vmcount}"
  name         = "${var.vm-name}"
  machine_type = "${var.machine-type}"
  zone         = "${var.region}"
  tags         = ["foo", "bar"]
  boot_disk {
    initialize_params {
      image = "${var.image_type}"
    }
  }


  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }
  network_interface {
    network = "${google_compute_network.vpc_network.name}"
    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    bar = "foo"
  }
  metadata_startup_script = "${file("installelk.sh")}"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
//end
