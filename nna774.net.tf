resource "cloudflare_record" "status-nna774-net-a" {
  zone_id = var.nna774_zone
  name   = "status.${var.nna774-net}"
  value  = "34.120.54.55"
  type   = "A"
  proxied = false
}
resource "cloudflare_record" "status-nna774-net-aaaa" {
  zone_id = var.nna774_zone
  name   = "status.${var.nna774-net}"
  value  = "2600:1901:0:6d85::"
  type   = "AAAA"
  proxied = false
}
resource "cloudflare_record" "status-nna774-net-txt" {
  zone_id = var.nna774_zone
  name   = "status.${var.nna774-net}"
  value  = "deno-com-validation=20baf8aee23c4c734d9ce30a"
  type   = "TXT"
  proxied = false
}
