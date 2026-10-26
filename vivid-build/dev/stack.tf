locals {
  fra1_vpc = "fc7cb40e-dc84-11e8-8b13-3cfdfea9f160" # default VPC fra1 (shared, not managed here)
}

module "stack" {
  source = "../../modules/vivid-build"

  droplets = {
    admin_panel = {
      name     = "build-admin-panel"
      size     = "s-2vcpu-4gb"
      image    = "168977420"
      region   = "fra1"
      vpc_uuid = local.fra1_vpc
    }
    render_backend = {
      name     = "build-render-backend"
      size     = "s-2vcpu-4gb"
      image    = "168977420"
      region   = "fra1"
      vpc_uuid = local.fra1_vpc
    }
    simulation_api = {
      name     = "build-simulation-api"
      size     = "s-2vcpu-2gb"
      image    = "195932981"
      region   = "fra1"
      vpc_uuid = local.fra1_vpc
    }
  }
  droplet_tags = ["NodeJS-24-22-1"]

  postgres = {
    name    = "build-backend-db"
    version = "17"
    size    = "db-s-1vcpu-1gb"
    region  = "fra1"
  }
  valkey = {
    name    = "backend-communication-redis"
    version = "8"
    size    = "db-s-1vcpu-1gb"
    region  = "fra1"
  }
  project_id              = "1929cc0d-525a-49a2-94a1-590a4b2aa820" # vivid-build-dev
  db_private_network_uuid = local.fra1_vpc

  buckets = {
    admin              = "build-admin-storage"
    render_api         = "build-render-api-storage"
    studio_api         = "build-studio-api-storage"
    simulation_api     = "build-simulation-api-storage"
    manual_dataset_api = "build-manual-dataset-api-storage"
    image_compositor   = "build-image-compositor-storage"
    modular_api        = "build-modular-api-storage"
  }

  vpn_droplet_id = "370421843"
  gpu_server_ip  = "185.254.253.211"
}
