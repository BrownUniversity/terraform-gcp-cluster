terraform {
  required_version = ">= 1.9.2"

  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "5.38.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}