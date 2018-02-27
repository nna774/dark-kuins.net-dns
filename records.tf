resource "cloudflare_record" "kizuna" {
  domain = "${var.cloudflare_domain}"
  name   = "kizuna.kitashirakawa.${var.cloudflare_domain}"
  value  = "192.50.220.190"
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "kizuna-6" {
  domain = "${var.cloudflare_domain}"
  name   = "kizuna.kitashirakawa.${var.cloudflare_domain}"
  value  = "2001:df0:8500:a700::1"
  type   = "AAAA"
  proxied = false
}
resource "cloudflare_record" "kizuna-force4" {
  domain = "${var.cloudflare_domain}"
  name   = "v4.kizuna.kitashirakawa.${var.cloudflare_domain}"
  value  = "192.50.220.190"
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "kizuna-force6" {
  domain = "${var.cloudflare_domain}"
  name   = "v6.kizuna.kitashirakawa.${var.cloudflare_domain}"
  value  = "2001:df0:8500:a700::1"
  type   = "AAAA"
  proxied = false
}

resource "cloudflare_record" "keybase-io" {
  domain = "${var.cloudflare_domain}"
  name   = "${var.cloudflare_domain}"
  value  = "keybase-site-verification=qlDaCiZkoK-_G17K8WTsVG2kVuwJYqGzkVbfj2bZCwo"
  type   = "TXT"
  ttl    = 86400
}