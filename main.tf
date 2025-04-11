provider "google" {
  credentials = file("gcp-service-account.json")
  project     = "your-gcp-project-id"
  region      = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "devops-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

}
