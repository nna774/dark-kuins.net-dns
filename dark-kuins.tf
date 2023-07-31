resource "cloudflare_record" "keybase-io" {
  zone_id = var.dark-kuins_zone
  name   = var.dark-kuins-net
  value  = "keybase-site-verification=qlDaCiZkoK-_G17K8WTsVG2kVuwJYqGzkVbfj2bZCwo"
  type   = "TXT"
  ttl    = 86400
}

resource "cloudflare_record" "google-site-verification" {
  zone_id = var.dark-kuins_zone
  name   = var.dark-kuins-net
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
  count  = length(var.gae_ips)
  zone_id = var.dark-kuins_zone
  name   = var.dark-kuins-net
  value  = element(var.gae_ips, count.index)
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "at-aaaa" {
  count  = length(var.gae_ipv6s)
  zone_id = var.dark-kuins_zone
  name   = var.dark-kuins-net
  value  = element(var.gae_ipv6s, count.index)
  type   = "AAAA"
  proxied = false
}
resource "cloudflare_record" "items" {
  count  = length(var.gae_ips)
  zone_id = var.dark-kuins_zone
  name   = "items.${var.dark-kuins-net}"
  value  = element(var.gae_ips, count.index)
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "items-aaaa" {
  count  = length(var.gae_ipv6s)
  zone_id = var.dark-kuins_zone
  name   = "items.${var.dark-kuins-net}"
  value  = element(var.gae_ipv6s, count.index)
  type   = "AAAA"
  proxied = false
}

resource "cloudflare_record" "www" {
  zone_id = var.dark-kuins_zone
  name   = "www.${var.dark-kuins-net}"
  value  = "c.storage.googleapis.com"
  type   = "CNAME"
  proxied = true
}

resource "cloudflare_record" "netbox" {
  zone_id = var.dark-kuins_zone
  name   = "netbox.${var.dark-kuins-net}"
  value  = "dk-netbox.herokuapp.com"
  type   = "CNAME"
  proxied = true
}

resource "cloudflare_record" "inside" {
  zone_id = var.dark-kuins_zone
  name   = "inside.${var.dark-kuins-net}"
  value  = "ushio.compute.kitashirakawa.dark-kuins.net"
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "smtp" {
  zone_id = var.dark-kuins_zone
  name   = "smtp.${var.dark-kuins-net}"
  value  = "hoshino.compute.kitashirakawa.dark-kuins.net"
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "spf" {
  zone_id = var.dark-kuins_zone
  name   = var.dark-kuins-net
  value  = "v=spf1 a:smtp.dark-kuins.net ~all"
  type   = "TXT"
  proxied = false
}

resource "cloudflare_record" "bluesky" {
  zone_id = var.dark-kuins_zone
  name   = "_atproto.${var.dark-kuins-net}"
  value  = "did=did:plc:dczkfrezqx3qijv3up5o4ljl"
  type   = "TXT"
  proxied = true
}
