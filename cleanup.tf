// 管理外だった古いレコードを destroy するために一旦 import する。apply 後にこのファイルごと消す。

import {
  to = cloudflare_record.acme-challenge-inside-nna774-net-1
  id = "3fe12308573ed4ea31993fd0cfb98f07/387b62b444b3d736a2721129d173cae8"
}
resource "cloudflare_record" "acme-challenge-inside-nna774-net-1" {
  zone_id = var.nna774_zone
  name    = "_acme-challenge.inside"
  content = "-zExC4CAHxvap1EgU6a6Cx6tCz247w6ViEZ1kr1I8L0"
  type    = "TXT"
  ttl     = 120
  proxied = false
}

import {
  to = cloudflare_record.acme-challenge-inside-nna774-net-2
  id = "3fe12308573ed4ea31993fd0cfb98f07/c8c01bd41c75368aa55a1b2fe78bfdfe"
}
resource "cloudflare_record" "acme-challenge-inside-nna774-net-2" {
  zone_id = var.nna774_zone
  name    = "_acme-challenge.inside"
  content = "vI6njQNqSUawa9qLPhvGDyLtt4R6MN2WVzEUTzdNY2g"
  type    = "TXT"
  ttl     = 120
  proxied = false
}

import {
  to = cloudflare_record.adsp-domainkey-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/8ca9a925bef7954f45586640ee300f7c"
}
resource "cloudflare_record" "adsp-domainkey-nna774-net" {
  zone_id = var.nna774_zone
  name    = "_adsp._domainkey"
  content = "dkim=unknown"
  type    = "TXT"
  proxied = false
}

import {
  to = cloudflare_record.ushio-domainkey-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/8a1293019dba0fbeded863596193283a"
}
resource "cloudflare_record" "ushio-domainkey-nna774-net" {
  zone_id = var.nna774_zone
  name    = "ushio._domainkey"
  content = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC3/s9vvVfGWz7SD3b3Prg2YXQmtX/tHPcZaxK5S4f2w5GnV7ThqjXN3HyVnwTuYYtf1lzo+U+CrqFrK55BMaVf/VlgJ90tTa++xGMF5ieJQfKPDRkdzDgLliQEj/4XO0WAfe0cZ1RBYAC8MPKQt9eIiAcOyJngmpc7LoQrjjx0lQIDAQAB"
  type    = "TXT"
  proxied = false
}

import {
  to = cloudflare_record.test-txt-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/b8800039787e5f2cb8865bfccfef1d0e"
}
resource "cloudflare_record" "test-txt-nna774-net" {
  zone_id = var.nna774_zone
  name    = "_test"
  content = "hoge"
  type    = "TXT"
  ttl     = 60
  proxied = false
}

import {
  to = cloudflare_record.gyazz-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/46c7a3a850771071450c777da2ac9145"
}
resource "cloudflare_record" "gyazz-nna774-net" {
  zone_id = var.nna774_zone
  name    = "gyazz"
  content = "nona-gyazz.herokuapp.com"
  type    = "CNAME"
  proxied = true
}

import {
  to = cloudflare_record.openyo-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/2b447280376d8a93da7a845b3e46a841"
}
resource "cloudflare_record" "openyo-nna774-net" {
  zone_id = var.nna774_zone
  name    = "openyo"
  content = "openyo.herokuapp.com"
  type    = "CNAME"
  proxied = true
}

import {
  to = cloudflare_record.inside-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/4da0e249ccebb5762a74613bde6704b9"
}
resource "cloudflare_record" "inside-nna774-net" {
  zone_id = var.nna774_zone
  name    = "inside"
  content = "ushio.compute.kitashirakawa.dark-kuins.net"
  type    = "CNAME"
  proxied = true
}

import {
  to = cloudflare_record.sakura-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/bdbc2fb5cad3ae0a5a10b80b1cb76c4e"
}
resource "cloudflare_record" "sakura-nna774-net" {
  zone_id = var.nna774_zone
  name    = "sakura"
  content = "sakura.compute.tachikawa.dark-kuins.net"
  type    = "CNAME"
  ttl     = 86400
  proxied = false
}

import {
  to = cloudflare_record.sakura-nna774-net-spf
  id = "3fe12308573ed4ea31993fd0cfb98f07/51e5c6a0d41ef03908d5dff32724f093"
}
resource "cloudflare_record" "sakura-nna774-net-spf" {
  zone_id = var.nna774_zone
  name    = "sakura"
  content = "v=spf1 +ip4:133.130.121.80 ~all"
  type    = "TXT"
  proxied = false
}

import {
  to = cloudflare_record.devel3-compute-mogamigawa
  id = "3353f56b0ad3326c345123fbb8192169/28341e5d0266f3a64768190c7c880326"
}
resource "cloudflare_record" "devel3-compute-mogamigawa" {
  zone_id = var.dark-kuins_zone
  name    = "devel3.compute.mogamigawa"
  content = "35.237.170.240"
  type    = "A"
  proxied = false
}

import {
  to = cloudflare_record.xmpp-client-srv-nna774-net
  id = "3fe12308573ed4ea31993fd0cfb98f07/fd8d7700067d8e6506388d02de996317"
}
resource "cloudflare_record" "xmpp-client-srv-nna774-net" {
  zone_id  = var.nna774_zone
  name     = "_xmpp-client._tcp"
  type     = "SRV"
  priority = 5
  proxied  = false
  data {
    priority = 5
    weight   = 0
    port     = 5222
    target   = "xmpp.nna774.net"
  }
}
