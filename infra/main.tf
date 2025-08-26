# Create a GCP Compute Engine instance
resource "google_compute_instance" "app_instance" {
  name         = "my-python-app-vm"
  machine_type = "e2-small"
  zone         = "us-central1-a" # Match your region

  # Use a standard Debian/Ubuntu image
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # Use the default VPC network
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  # Attach the service account to the VM
  service_account {
    scopes = ["cloud-platform"] # Broad scope for simplicity; refine for production
  }

}

# Allow HTTP traffic to the instance
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-app"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
# Allow HTTP traffic to the instance
resource "google_compute_firewall" "allow_https" {
  name    = "allow-https-app"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }


}
