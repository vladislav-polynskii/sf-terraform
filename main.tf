terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.99.1"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = "b1gtha8pqtnltvvek84n"
  folder_id = "b1gs72ujqitp34p9s4lk"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "network" {}

resource "yandex_vpc_subnet" "subnet1" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}

resource "yandex_vpc_subnet" "subnet2" {
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.6.0.0/24"]
}

module "ya_instance_1" {
  source                = "./modules/ya-instance"
  instance_family_image = "lemp"
  instance_zone         = "ru-central1-a"
  vpc_subnet_id         = yandex_vpc_subnet.subnet1.id
}

module "ya_instance_2" {
  source                = "./modules/ya-instance"
  instance_family_image = "lamp"
  instance_zone         = "ru-central1-b"
  vpc_subnet_id         = yandex_vpc_subnet.subnet2.id
}

resource "yandex_lb_target_group" "sf-target-group" {
  name      = "sf-target-group"
  region_id = "ru-central1"

  target {
    subnet_id = yandex_vpc_subnet.subnet1.id
    address   = module.ya_instance_1.internal_ip_address_vm
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet2.id
    address   = module.ya_instance_2.internal_ip_address_vm
  }
}

resource "yandex_lb_network_load_balancer" "sf-load-balancer" {
  name = "sf-load-balancer"

  listener {
    name = "sf-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.sf-target-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
