terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.13.0"
    }
  }
}

provider "vault" {
  address               = "https://localhost:8200"
  skip_tls_verify       = true
  max_lease_ttl_seconds = 600
  auth_login {
    path   = "auth/${var.login_approle_path}/login"
    method = "approle"

    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }
}