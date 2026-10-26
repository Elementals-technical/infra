# Flat root resources -> module "stack" (2026-10-26)

# Droplets
moved {
  from = digitalocean_droplet.admin_panel
  to   = module.stack.digitalocean_droplet.this["admin_panel"]
}
moved {
  from = digitalocean_droplet.render_backend
  to   = module.stack.digitalocean_droplet.this["render_backend"]
}
moved {
  from = digitalocean_droplet.simulation_api
  to   = module.stack.digitalocean_droplet.this["simulation_api"]
}

# Database clusters
moved {
  from = digitalocean_database_cluster.postgres
  to   = module.stack.digitalocean_database_cluster.postgres
}
moved {
  from = digitalocean_database_cluster.valkey
  to   = module.stack.digitalocean_database_cluster.valkey
}

# Database firewalls
moved {
  from = digitalocean_database_firewall.postgres
  to   = module.stack.digitalocean_database_firewall.postgres
}
moved {
  from = digitalocean_database_firewall.valkey
  to   = module.stack.digitalocean_database_firewall.valkey
}

# Spaces buckets
moved {
  from = digitalocean_spaces_bucket.admin
  to   = module.stack.digitalocean_spaces_bucket.this["admin"]
}
moved {
  from = digitalocean_spaces_bucket.render_api
  to   = module.stack.digitalocean_spaces_bucket.this["render_api"]
}
moved {
  from = digitalocean_spaces_bucket.studio_api
  to   = module.stack.digitalocean_spaces_bucket.this["studio_api"]
}
moved {
  from = digitalocean_spaces_bucket.simulation_api
  to   = module.stack.digitalocean_spaces_bucket.this["simulation_api"]
}
moved {
  from = digitalocean_spaces_bucket.manual_dataset_api
  to   = module.stack.digitalocean_spaces_bucket.this["manual_dataset_api"]
}
moved {
  from = digitalocean_spaces_bucket.image_compositor
  to   = module.stack.digitalocean_spaces_bucket.this["image_compositor"]
}
moved {
  from = digitalocean_spaces_bucket.modular_api
  to   = module.stack.digitalocean_spaces_bucket.this["modular_api"]
}
