resource "digitalocean_spaces_bucket" "admin" {
  name          = "build-admin-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl] # провайдер не читает ACL при импорте; ACL меняем отдельным шагом
  }
}

resource "digitalocean_spaces_bucket" "render_api" {
  name          = "build-render-api-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl]
  }
}

resource "digitalocean_spaces_bucket" "studio_api" {
  name          = "build-studio-api-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl]
  }
}

resource "digitalocean_spaces_bucket" "simulation_api" {
  name          = "build-simulation-api-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl]
  }
}

resource "digitalocean_spaces_bucket" "manual_dataset_api" {
  name          = "build-manual-dataset-api-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl]
  }
}

resource "digitalocean_spaces_bucket" "image_compositor" {
  name          = "build-image-compositor-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl]
  }
}

resource "digitalocean_spaces_bucket" "modular_api" {
  name          = "build-modular-api-storage"
  region        = "fra1"
  acl           = "private"
  force_destroy = false

  versioning {
    enabled = false
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [acl]
  }
}
