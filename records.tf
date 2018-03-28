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

resource "cloudflare_record" "google-site-verification" {
  domain = "${var.cloudflare_domain}"
  name   = "${var.cloudflare_domain}"
  value  = "google-site-verification=706gPugltIAlN2H_7qB68DA9sy07G_GyF25O1jGK3m8"
  type   = "TXT"
  ttl    = 86400
}

variable "gae_ips" {
  default = ["216.239.32.21", "216.239.34.21", "216.239.36.21", "216.239.38.21"]
}
variable "gae_ipv6s" {
  default = ["2001:4860:4802:32::15", "2001:4860:4802:34::15", "2001:4860:4802:36::15", "2001:4860:4802:38::15"]
}
resource "cloudflare_record" "at" {
  count  = "${length(var.gae_ips)}"
  domain = "${var.cloudflare_domain}"
  name   = "${var.cloudflare_domain}"
  value  = "${element(var.gae_ips, count.index)}"
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "at-aaaa" {
  count  = "${length(var.gae_ipv6s)}"
  domain = "${var.cloudflare_domain}"
  name   = "${var.cloudflare_domain}"
  value  = "${element(var.gae_ipv6s, count.index)}"
  type   = "AAAA"
  proxied = false
}
