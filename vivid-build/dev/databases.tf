resource "digitalocean_database_cluster" "postgres" {
  name                 = "build-backend-db"
  engine               = "pg"
  version              = "17"
  size                 = "db-s-1vcpu-1gb"
  node_count           = 1
  region               = "fra1"
  private_network_uuid = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160"
  project_id           = "1929cc0d-525a-49a2-94a1-590a4b2aa820"

  lifecycle {
    prevent_destroy = true
  }
}

resource "digitalocean_database_cluster" "valkey" {
  name                 = "backend-communication-redis"
  engine               = "valkey"
  version              = "8"
  size                 = "db-s-1vcpu-1gb"
  node_count           = 1
  region               = "fra1"
  private_network_uuid = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160"
  project_id           = "1929cc0d-525a-49a2-94a1-590a4b2aa820"

  lifecycle {
    prevent_destroy = true
  }
}
