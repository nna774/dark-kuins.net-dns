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

import {
  to = cloudflare_record.spf-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/a8de1073e07c431420a1fd4c1663aa96"
}
resource "cloudflare_record" "spf-nna774-net" {
  zone_id = var.nna774_zone
  name   = var.nna774-net
  content = "v=spf1 include:_spf.google.com ~all"
  type   = "TXT"
  proxied = false
}

// 以下は Cloudflare で手作業で作られていたレコードを import したもの。state 上の name が相対名なので、FQDN にすると replace になる。
resource "cloudflare_record" "google-site-verification-nna774-net" {
  zone_id = var.nna774_zone
  name    = var.nna774-net
  content = "google-site-verification=1XrH9ZZANKaDGt1xVu5pSklARaXZ_gFVXMEijTnAQe4"
  type    = "TXT"
  proxied = false
}
resource "cloudflare_record" "mx-nna774-net-01" {
  zone_id  = var.nna774_zone
  name     = var.nna774-net
  content  = "aspmx.l.google.com"
  type     = "MX"
  priority = 1
  ttl      = 86400
  proxied  = false
}
resource "cloudflare_record" "mx-nna774-net-02" {
  zone_id  = var.nna774_zone
  name     = var.nna774-net
  content  = "alt1.aspmx.l.google.com"
  type     = "MX"
  priority = 5
  ttl      = 86400
  proxied  = false
}
resource "cloudflare_record" "mx-nna774-net-03" {
  zone_id  = var.nna774_zone
  name     = var.nna774-net
  content  = "alt2.aspmx.l.google.com"
  type     = "MX"
  priority = 5
  ttl      = 86400
  proxied  = false
}
resource "cloudflare_record" "mx-nna774-net-04" {
  zone_id  = var.nna774_zone
  name     = var.nna774-net
  content  = "aspmx2.googlemail.com"
  type     = "MX"
  priority = 10
  ttl      = 86400
  proxied  = false
}
resource "cloudflare_record" "mx-nna774-net-05" {
  zone_id  = var.nna774_zone
  name     = var.nna774-net
  content  = "aspmx3.googlemail.com"
  type     = "MX"
  priority = 10
  ttl      = 86400
  proxied  = false
}
resource "cloudflare_record" "google-domainkey-nna774-net" {
  zone_id = var.nna774_zone
  name    = "google._domainkey"
  content = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAj6u92Auh6ApYW2yJY6JMxaariyR5qaLKdQCt3bXdig20EAOVg6eikgx+QHN1c+13vhT1JGRY2DmQlOoFS3HyQMPhTBxTJOOSZXUXGMF1We0jVVuD6b+GdLyMiLZU6kngkJnoYYIG5aC7f4ES3hxiN+fNGZ3z65ihWiYnwoCd0AQMDilIjUh93jveIIx62gu+L1aw9vLy6j7eKRRNAmklVtuP/+xRI6KCsREIEStmMjno5umvkXWPpicw8fh5XR7RyVRg2K5OQtXF9Wo2t0HUrTRIF9DL1fTlYFVY+DHGWV6pWPWAPP2pGWl0GzAXEHTTAAATzV2qZeh5axD32CVY3wIDAQAB"
  type    = "TXT"
  proxied = false
}
resource "cloudflare_record" "cf2024-1-domainkey-nna774-net" {
  zone_id = var.nna774_zone
  name    = "cf2024-1._domainkey"
  content = "\"v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiweykoi+o48IOGuP7GR3X0MOExCUDY/BCRHoWBnh3rChl7WhdyCxW3jgq1daEjPPqoi7sJvdg5hEQVsgVRQP4DcnQDVjGMbASQtrY4WmB1VebF+RPJB2ECPsEDTpeiI5ZyUAwJaVX7r6bznU67g7LvFq35yIo4sdlmtZGV+i0H4cpYH9+3JJ78k\" \"m4KXwaf9xUJCWF6nxeD+qG6Fyruw1Qlbds2r85U9dkNDVAS3gioCvELryh1TxKGiVTkg4wqHTyHfWsp7KD3WQHYJn0RyfJJu6YEmL77zonn7p2SRMvTMP3ZEXibnC9gz3nnhR6wcYL8Q7zXypKTMD58bTixDSJwIDAQAB\""
  type    = "TXT"
  proxied = false
}
resource "cloudflare_record" "dmarc-nna774-net" {
  zone_id = var.nna774_zone
  name    = "_dmarc"
  content = "v=DMARC1; p=none; rua=mailto:postmaster@nna774.net"
  type    = "TXT"
  proxied = false
}
resource "cloudflare_record" "keybase-nna774-net" {
  zone_id = var.nna774_zone
  name    = "_keybase"
  content = "keybase-site-verification=DaQPIGPDOKaocNsNYA83bXEBuNFqjZH50xhkULoXTqs"
  type    = "TXT"
  ttl     = 86400
  proxied = false
}
resource "cloudflare_record" "loc-nna774-net" {
  zone_id = var.nna774_zone
  name    = var.nna774-net
  type    = "LOC"
  ttl     = 86400
  proxied = false
  data {
    lat_degrees    = 50
    lat_minutes    = 27
    lat_seconds    = 3.4
    lat_direction  = "N"
    long_degrees   = 30
    long_minutes   = 31
    long_seconds   = 21.5
    long_direction = "E"
    altitude       = 0
    size           = 10
    precision_horz = 0
    precision_vert = 0
  }
}
resource "cloudflare_record" "s-nna774-net-google-site-verification" {
  zone_id = var.nna774_zone
  name    = "s"
  content = "google-site-verification=h8QciUoTWkVmtsQ3alV6qU9fkfBrC45oeix4sw-W5yY"
  type    = "TXT"
  proxied = false
}
resource "cloudflare_record" "s-nna774-net-mx-01" {
  zone_id  = var.nna774_zone
  name     = "s"
  content  = "aspmx.l.google.com"
  type     = "MX"
  priority = 1
  proxied  = false
}
resource "cloudflare_record" "s-nna774-net-mx-02" {
  zone_id  = var.nna774_zone
  name     = "s"
  content  = "alt1.aspmx.l.google.com"
  type     = "MX"
  priority = 5
  proxied  = false
}
resource "cloudflare_record" "s-nna774-net-mx-03" {
  zone_id  = var.nna774_zone
  name     = "s"
  content  = "alt2.aspmx.l.google.com"
  type     = "MX"
  priority = 5
  proxied  = false
}
resource "cloudflare_record" "s-nna774-net-mx-04" {
  zone_id  = var.nna774_zone
  name     = "s"
  content  = "aspmx2.googlemail.com"
  type     = "MX"
  priority = 10
  proxied  = false
}
resource "cloudflare_record" "s-nna774-net-mx-05" {
  zone_id  = var.nna774_zone
  name     = "s"
  content  = "aspmx3.googlemail.com"
  type     = "MX"
  priority = 10
  proxied  = false
}
resource "cloudflare_record" "static-nna774-net" {
  zone_id = var.nna774_zone
  name    = "static"
  content = "c.storage.googleapis.com"
  type    = "CNAME"
  proxied = true
}
resource "cloudflare_record" "test-nna774-net" {
  zone_id = var.nna774_zone
  name    = "test"
  content = "c.storage.googleapis.com"
  type    = "CNAME"
  proxied = true
}
