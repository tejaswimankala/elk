output "instance-name" {
  value = google_compute_instance.myinstance-m.name
}

output "VPC_id" {
  description = "Identity of the VPC"
  value       = "${google_compute_network.vpc_network.self_link}"
}

output "VPC_name" {
  description = "Name of the VPC"
  value       = "${google_compute_network.vpc_network.name}"
}

output "firewall_name"{
   value = "${google_compute_firewall.myfirewall-metric.name}"
}

output "External-ip"{
   value = "${google_compute_instance.myinstance-m.network_interface[0].access_config}"
}


