variable "cloudflare_email" {}
variable "cloudflare_token" {}
variable "cloudflare_domain" {
  default = "dark-kuins.net"
}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

