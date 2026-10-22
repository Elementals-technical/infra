locals {
  vpn_droplet_id = "370421843"       # OpenVPN-сервер (shared, вне этого state)
  gpu_server_ip  = "185.254.253.211" # мини-датацентр с GPU / оркестратором
}

resource "digitalocean_database_firewall" "postgres" {
  cluster_id = digitalocean_database_cluster.postgres.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.admin_panel.id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.render_backend.id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.simulation_api.id
  }
  rule {
    type  = "droplet"
    value = local.vpn_droplet_id
  }
}

resource "digitalocean_database_firewall" "valkey" {
  cluster_id = digitalocean_database_cluster.valkey.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.admin_panel.id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.render_backend.id
  }
  rule {
    type  = "droplet"
    value = digitalocean_droplet.simulation_api.id
  }
  rule {
    type  = "droplet"
    value = local.vpn_droplet_id
  }
  rule {
    type  = "ip_addr"
    value = local.gpu_server_ip
  }
}
