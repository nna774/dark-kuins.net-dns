resource "cloudflare_record" "test" {
  domain = "${var.cloudflare_domain}"
  name   = "kizuna.kitashirakawa.${var.cloudflare_domain}"
  value  = "192.50.220.190"
  type   = "A"
  proxied = false
#  ttl    = 3600
}

