provider "google" {
  credentials = file("<PATH_TO_CREDENTIALS>") # Substitua pelo caminho do arquivo de credenciais JSON
  project     = "<PROJECT_ID>"                # Substitua pelo seu ID do projeto
  region      = "us-west1"                    # Região onde os recursos serão criados
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"         # Nome da instância
  machine_type = "e2-medium"                  # Tipo da máquina
  zone         = "us-west1-a"                 # Zona onde a instância será criada

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"       # Imagem do sistema operacional
    }
  }

  network_interface {
    network = "default"                       # Rede padrão
    access_config {
      // Aloca um IP público
    }
  }
}
