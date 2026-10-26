variable "droplets" {
  description = "Backend droplets: role => settings. Keys: admin_panel, render_backend, simulation_api"
  type = map(object({
    name     = string
    size     = string
    image    = string
    region   = string
    vpc_uuid = string
  }))
}

variable "droplet_tags" {
  description = "Tags applied to all droplets"
  type        = list(string)
  default     = []
}

variable "postgres" {
  description = "PostgreSQL cluster settings"
  type = object({
    name    = string
    version = string
    size    = string
    region  = string
  })
}

variable "valkey" {
  description = "Valkey cluster settings"
  type = object({
    name    = string
    version = string
    size    = string
    region  = string
  })
}

variable "project_id" {
  description = "DO project ID the database clusters belong to"
  type        = string
}

variable "db_private_network_uuid" {
  description = "VPC UUID for the database clusters"
  type        = string
}

variable "spaces_region" {
  description = "Region for Spaces buckets"
  type        = string
  default     = "fra1"
}

variable "buckets" {
  description = "Spaces buckets: role => bucket name"
  type        = map(string)
}

variable "vpn_droplet_id" {
  description = "OpenVPN server droplet ID (shared, managed outside this state)"
  type        = string
}

variable "gpu_server_ip" {
  description = "Public IP of the on-prem GPU server (render orchestrator)"
  type        = string
}
