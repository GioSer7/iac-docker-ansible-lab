terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "docker" {}

resource "docker_image" "ssh_server" {
  name = "ubuntu-ssh-iac:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "iac_server" {
  name  = "iac-target-server"
  image = docker_image.ssh_server.image_id

  ports {
    internal = 22
    external = 2222
  }

  ports {
    internal = 80
    external = 8080
  }
}
