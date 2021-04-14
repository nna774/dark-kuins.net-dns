variable "cloudflare_api_token" {}
variable "dark-kuins-net" {
  default = "dark-kuins.net"
}
variable "dark-kuins_zone" {
  default = "3353f56b0ad3326c345123fbb8192169"
}

variable "nna774-net" {
  default = "nna774.net"
}
variable "nna774_zone" {
  default = "3fe12308573ed4ea31993fd0cfb98f07"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
