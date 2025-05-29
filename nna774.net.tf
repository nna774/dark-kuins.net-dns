variable "nna774-cloudfront" {
  default = "d1n5wgn7m5o0pa.cloudfront.net"
}
resource "cloudflare_record" "at-nna774-net" {
  zone_id = var.nna774_zone
  name   = var.nna774-net
  content = var.nna774-cloudfront
  type   = "CNAME"
  proxied = true
}
resource "cloudflare_record" "www-nna774-net" {
  zone_id = var.nna774_zone
  name   = "www.${var.nna774-net}"
  content = var.nna774-cloudfront
  type   = "CNAME"
  proxied = true
}
resource "cloudflare_record" "blog-nna774-net" {
  zone_id = var.nna774_zone
  name   = "blog.${var.nna774-net}"
  content = var.nna774-cloudfront
  type   = "CNAME"
  proxied = true
}

resource "cloudflare_record" "status-nna774-net-a" {
  zone_id = var.nna774_zone
  name   = "status.${var.nna774-net}"
  content = "34.120.54.55"
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "status-nna774-net-aaaa" {
  zone_id = var.nna774_zone
  name   = "status.${var.nna774-net}"
  content = "2600:1901:0:6d85::"
  type   = "AAAA"
  proxied = false
}
resource "cloudflare_record" "status-nna774-net-txt" {
  zone_id = var.nna774_zone
  name   = "status.${var.nna774-net}"
  content = "deno-com-validation=20baf8aee23c4c734d9ce30a"
  type   = "TXT"
  proxied = false
}

resource "cloudflare_record" "i-nna774-net-mx-01" {
  zone_id = var.nna774_zone
  name   = "i.${var.nna774-net}"
  content = "mx01.mail.icloud.com"
  priority = 10
  type   = "MX"
  proxied = false
}
resource "cloudflare_record" "i-nna774-net-mx-02" {
  zone_id = var.nna774_zone
  name   = "i.${var.nna774-net}"
  content = "mx02.mail.icloud.com"
  priority = 10
  type   = "MX"
  proxied = false
}
resource "cloudflare_record" "i-nna774-net-mx-validation" {
  zone_id = var.nna774_zone
  name   = "i.${var.nna774-net}"
  content = "apple-domain=qrJNVBJOHk2sWNwU"
  type   = "TXT"
  proxied = false
}
resource "cloudflare_record" "i-nna774-net-mx-spf" {
  zone_id = var.nna774_zone
  name   = "i.${var.nna774-net}"
  content = "v=spf1 include:icloud.com ~all"
  type   = "TXT"
  proxied = false
}
resource "cloudflare_record" "i-nna774-net-mx-dkim" {
  zone_id = var.nna774_zone
  name   = "sig1._domainkey.i.${var.nna774-net}"
  content = "sig1.dkim.i.nna774.net.at.icloudmailadmin.com."
  type   = "CNAME"
  proxied = false
}

resource "cloudflare_record" "bluesky" {
  zone_id = var.nna774_zone
  name   = "_atproto.${var.nna774-net}"
  content = "did=did:plc:dczkfrezqx3qijv3up5o4ljl"
  type   = "TXT"
  proxied = false
}

resource "cloudflare_record" "example" {
  zone_id = var.nna774_zone
  name   = "example.${var.nna774-net}"
  content = "192.50.220.189"
  type   = "A"
  proxied = false
}

