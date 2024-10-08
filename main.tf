provider "google" {
  credentials = file("caminho/para/seu/arquivo.json") # Substitua pelo caminho do seu arquivo de credenciais JSON
  project     = "project-id-gerado-automaticamente"     # Use o ID gerado pelo Google Cloud
  region      = "us-west1"
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "e2-medium"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Aloca um IP público
    }
  }
}
