locals {
  fra1_vpc = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160" # default VPC fra1 (shared, not managed here)
  sfo3_vpc = "dccc0eba-c094-4962-8716-6b017adfabb0" # default VPC sfo3 (shared, not managed here)
}

module "stack" {
  source = "../../modules/vivid-build"

  droplets = {
    admin_panel = {
      name     = "render-admin-panel"
      size     = "s-4vcpu-8gb"
      image    = "142476112"
      region   = "fra1"
      vpc_uuid = local.fra1_vpc
    }
    # Historically in sfo3; migration to fra1 planned as a separate task
    render_backend = {
      name     = "render-backend"
      size     = "s-4vcpu-8gb"
      image    = "142476112"
      region   = "sfo3"
      vpc_uuid = local.sfo3_vpc
    }
    simulation_api = {
      name       = "simulation-api-prod-v2"
      size       = "s-2vcpu-4gb"
      image      = "235153036"
      region     = "fra1"
      vpc_uuid   = local.fra1_vpc
      monitoring = true
    }
  }
  droplet_tags = ["NodeJS-24-22-1"]

  postgres = {
    name    = "render-backend-db"
    version = "15"
    size    = "db-s-4vcpu-8gb"
    region  = "fra1"
  }
  valkey = {
    name    = "backend-communication-redis-prod"
    version = "8"
    size    = "db-s-1vcpu-1gb"
    region  = "fra1"
  }
  project_id              = "fd71db3c-a4a8-41e5-b71a-5f7bbca1f1f0" # vivid-build-prod
  db_private_network_uuid = local.fra1_vpc

  # modular_api bucket does not exist in prod yet; will be created separately
  buckets = {
    admin              = "2d-render-admin-storage"
    render_api         = "2d-render-api-storage"
    studio_api         = "3d-render-api-storage"
    simulation_api     = "simulation-api-storage"
    manual_dataset_api = "manual-dataset-api-storage"
    image_compositor   = "vivid-image-compositor-storage"
  }

  vpn_droplet_id = "370421843"
  gpu_server_ip  = "185.254.253.211"

  valkey_extra_droplet_ids = [
    "557476160", # ai-agent-orchestrator (other project)
  ]
}
