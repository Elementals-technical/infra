resource "digitalocean_database_cluster" "postgres" {
  name                 = var.postgres.name
  engine               = "pg"
  version              = var.postgres.version
  size                 = var.postgres.size
  node_count           = 1
  region               = var.postgres.region
  private_network_uuid = var.db_private_network_uuid
  project_id           = var.project_id

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_database_cluster" "valkey" {
  name                 = var.valkey.name
  engine               = "valkey"
  version              = var.valkey.version
  size                 = var.valkey.size
  node_count           = 1
  region               = var.valkey.region
  private_network_uuid = var.db_private_network_uuid
  project_id           = var.project_id

  lifecycle {
    prevent_destroy = true
  }
}
