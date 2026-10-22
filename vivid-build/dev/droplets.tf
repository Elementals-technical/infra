resource "digitalocean_droplet" "admin_panel" {
  name     = "build-admin-panel"
  region   = "fra1"
  size     = "s-2vcpu-4gb"
  image    = "168977420"
  vpc_uuid = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160"

  backups           = false
  monitoring        = false
  ipv6              = false
  public_networking = true
  resize_disk       = true
}

resource "digitalocean_droplet" "render_backend" {
  name     = "build-render-backend"
  region   = "fra1"
  size     = "s-2vcpu-4gb"
  image    = "168977420"
  vpc_uuid = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160"

  backups           = false
  monitoring        = false
  ipv6              = false
  public_networking = true
  resize_disk       = true
}

resource "digitalocean_droplet" "simulation_api" {
  name     = "build-simulation-api"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  image    = "195932981"
  vpc_uuid = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160"

  backups           = false
  monitoring        = false
  ipv6              = false
  public_networking = true
  resize_disk       = true
}
