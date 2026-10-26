# Database firewalls are authoritative: any rule not listed here will be removed.

resource "digitalocean_database_firewall" "postgres" {
  cluster_id = digitalocean_database_cluster.postgres.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.this["admin_panel"].id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.this["render_backend"].id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.this["simulation_api"].id
  }
  rule {
    type  = "droplet"
    value = var.vpn_droplet_id
  }
}

resource "digitalocean_database_firewall" "valkey" {
  cluster_id = digitalocean_database_cluster.valkey.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.this["admin_panel"].id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.this["render_backend"].id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.this["simulation_api"].id
  }
  rule {
    type  = "droplet"
    value = var.vpn_droplet_id
  }
  rule {
    type  = "ip_addr"
    value = var.gpu_server_ip
  }
}
