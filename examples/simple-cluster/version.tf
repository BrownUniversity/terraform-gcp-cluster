terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google      = ">= 4.72.0, <5.0.0"
    google-beta = ">= 4.72.0, <5.0.0"
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}
