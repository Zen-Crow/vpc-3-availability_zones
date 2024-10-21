terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.100"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  token     = var.token
}
