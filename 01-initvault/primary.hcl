#disable_cache = true
disable_mlock = true
ui = true

listener "tcp" {
  address = "localhost:8200"
  cluster_address = "localhost:8201"
  tls_disable = "false"
  tls_cert_file = "../ca-certs/localhost.pem"
  tls_key_file  = "../ca-certs/localhost-key.pem"  
  tls_client_ca_file = "../ca-certs/vault-https-ca.pem"
  telemetry {
    unauthenticated_metrics_access = true
  }  
}

cluster_addr = "https://localhost:8201"
api_addr = "https://localhost:8200"

storage "raft" {
	path = "./vault-db"
	node_id = "primary"
	performance_multiplier = 1
}

telemetry {
  prometheus_retention_time = "30s"
  disable_hostname = true
}

