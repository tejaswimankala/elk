variable project {
  description = "project name"
  default = "fleet-toolbox-331704"
}

variable elk-vpc-network {
  description = "network name"
  #default     = "project_id"
}

variable elk-firewall {
  description = "firewall name"
  default     = "elk-firewall"
}


variable vmcount {
  description = "no of vm s"
  default     = "1"
}

variable vm-name {
  description = "name of the instance"
  default     = "elk-centos-metricbeat"
}

variable machine-type {
  description = "type of instance"
  default     = "n1-standard-1"
}
variable region {
  description = "which region you want to create vm"
  default     = "us-central1-a"
}

variable image_type {
  description = "image os type"
  default     = "centos-7"
}
