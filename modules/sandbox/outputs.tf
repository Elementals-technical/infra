output "droplet_ip" {
  description = "Public IPv4 of the web droplet"
  value       = digitalocean_droplet.web.ipv4_address
}
