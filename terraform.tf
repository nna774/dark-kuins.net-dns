terraform {
  backend "s3" {}
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.13"
}
