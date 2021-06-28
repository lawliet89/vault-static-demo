terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.21.0"
    }
  }
}
