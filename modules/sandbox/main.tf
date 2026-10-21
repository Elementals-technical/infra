resource "digitalocean_project" "sandbox" {
  name        = "terraform-sandbox-${var.environment}"
  description = "Sandbox to practice with Terraform"
  environment = "Development"
  resources   = [digitalocean_droplet.web.urn]
}

resource "digitalocean_droplet" "web" {
  name   = "web-${var.environment}"
  region = "fra1"
  size   = var.droplet_size
  image  = "ubuntu-24-04-x64"
  tags   = [var.environment]
  resize_disk = false
}
