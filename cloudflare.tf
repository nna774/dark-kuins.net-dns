variable "cloudflare_api_token" {}
variable "cloudflare_domain" {
  default = "dark-kuins.net"
}
variable "cloudflare_zone" {
  default = "3353f56b0ad3326c345123fbb8192169"
}
provider "cloudflare" {
  version = "~> 2.0"
  api_token = "${var.cloudflare_api_token}"
}
