# docker-envoy-https-proxy

A simple Envoy container that templates a basic HTTPS proxy configuration.

Find Docker image at <https://github.com/aslafy-z/docker-envoy-https-proxy/pkgs/container/envoy-https-proxy>.

## Environment variables

| Variable | Default | Description |
| --- | --- | --- |
| `BIND_ADDRESS` | `0.0.0.0` | IP address to bind to |
| `BIND_PORT` | `443` | Port to bind to |
| `BIND_TLS_CERT_B64` | - | TLS certificate to use for HTTPS |
| `BIND_TLS_KEY_B64` | - | TLS key to use for HTTPS |
| `TARGET_HOST` | - | Host to proxy to |
| `TARGET_PORT` | - | Port to proxy to |
| `TARGET_TLS_CERT_B64` | - | TLS certificate to use for proxying |
