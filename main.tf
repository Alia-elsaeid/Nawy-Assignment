terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_image" {
  name          = "aliaelsaeid/hello-node-app:latest"
  keep_locally  = false
}

resource "docker_container" "app_container" {
  name  = "hello-node-app"
  image = docker_image.app_image.name

  ports {
    internal = 3000
    external = 3000
  }
}
