terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "searchable-web-node" {
  name = "searchable-web-node"
  build {
    path = "../"
    tag  = ["searchable-web-node:develop"]
    build_arg = {
      foo : "zoo"
    }
    label = {
      author : "zoo"
    }
  }
}

resource "docker_container" "matkonims-service" {
  image = docker_image.searchable-web-node.latest
  name  = "matkonims-terraform"
  ports {
    internal = 8080
    external = 80
  }
  env = ["APP_NAME=MATKONIMS_TERRAFORM", "TEST_KEY=TEST_VAL"]
}
