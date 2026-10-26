resource "digitalocean_droplet" "this" {
  for_each = var.droplets

  name     = each.value.name
  region   = each.value.region
  size     = each.value.size
  image    = each.value.image
  vpc_uuid = each.value.vpc_uuid
  tags     = var.droplet_tags

  backups           = false
  monitoring        = each.value.monitoring
  ipv6              = false
  public_networking = true
  resize_disk       = true # TODO: switch to false in a separate apply
}
