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
resource "cloudflare_record" "items" {
  count  = "${length(var.gae_ips)}"
  domain = "${var.cloudflare_domain}"
  name   = "items.${var.cloudflare_domain}"
  value  = "${element(var.gae_ips, count.index)}"
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "items-aaaa" {
  count  = "${length(var.gae_ipv6s)}"
  domain = "${var.cloudflare_domain}"
  name   = "items.${var.cloudflare_domain}"
  value  = "${element(var.gae_ipv6s, count.index)}"
  type   = "AAAA"
  proxied = false
}

resource "cloudflare_record" "www" {
  domain = "${var.cloudflare_domain}"
  name   = "www.${var.cloudflare_domain}"
  value  = "c.storage.googleapis.com"
  type   = "CNAME"
  proxied = true
}

resource "cloudflare_record" "auth" {
  domain = "${var.cloudflare_domain}"
  name   = "auth.${var.cloudflare_domain}"
  value  = "auth-dark-kuins-net.herokuapp.com"
  type   = "CNAME"
  proxied = true
}

resource "cloudflare_record" "netbox" {
  domain = "${var.cloudflare_domain}"
  name   = "netbox.${var.cloudflare_domain}"
  value  = "ushio.compute.kitashirakawa.dark-kuins.net"
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "inside" {
  domain = "${var.cloudflare_domain}"
  name   = "inside.${var.cloudflare_domain}"
  value  = "ushio.compute.kitashirakawa.dark-kuins.net"
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "devel3-short" {
  domain = "${var.cloudflare_domain}"
  name   = "devel3.c.mogamigawa.${var.cloudflare_domain}"
  value  = "devel3.compute.mogamigawa.${var.cloudflare_domain}"
  type   = "CNAME"
  proxied = false
}
resource "cloudflare_record" "devel3-very-short" {
  domain = "${var.cloudflare_domain}"
  name   = "devel3.c.m.${var.cloudflare_domain}"
  value  = "devel3.compute.mogamigawa.${var.cloudflare_domain}"
  type   = "CNAME"
  proxied = false
}
resource "cloudflare_record" "devel3-force-v4" {
  domain = "${var.cloudflare_domain}"
  name   = "v4.devel3.compute.mogamigawa.${var.cloudflare_domain}"
  value  = "devel3.compute.mogamigawa.${var.cloudflare_domain}"
  type   = "CNAME"
  proxied = false
}
resource "cloudflare_record" "devel3-force-v4-short" {
  domain = "${var.cloudflare_domain}"
  name   = "v4.devel3.c.mogamigawa.${var.cloudflare_domain}"
  value  = "v4.devel3.compute.mogamigawa.${var.cloudflare_domain}"
  type   = "CNAME"
  proxied = false
}
resource "cloudflare_record" "devel3-force-v4-very-short" {
  domain = "${var.cloudflare_domain}"
  name   = "v4.devel3.c.m.${var.cloudflare_domain}"
  value  = "v4.devel3.compute.mogamigawa.${var.cloudflare_domain}"
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "grafana" {
  domain = "${var.cloudflare_domain}"
  name   = "grafana.${var.cloudflare_domain}"
  value  = "tsugu.compute.nishiogikubo.dark-kuins.net"
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "rack-auth-request-testkun-herokuapp" {
  domain = "${var.cloudflare_domain}"
  name   = "rack-auth-request-testkun--herokuapp.${var.cloudflare_domain}"
  value  = "rack-auth-request-testkun.herokuapp.com"
  type   = "CNAME"
  proxied = true
}
resource "cloudflare_record" "rack-auth-request-testkun" {
  domain = "${var.cloudflare_domain}"
  name   = "rack-auth-request-testkun.${var.cloudflare_domain}"
  value  = "rack-auth-request-testkun--herokuapp.${var.cloudflare_domain}"
  type   = "CNAME"
  proxied = true
}
