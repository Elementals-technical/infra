resource "digitalocean_spaces_bucket" "this" {
  for_each = var.buckets

  name          = each.value
  region        = var.spaces_region
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    # Provider does not read bucket ACL on import; remove in a separate apply
    ignore_changes = [acl]
  }
}
