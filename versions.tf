terraform {
  required_version = "0.15.0"

  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 1.2"
    }
  }
}
