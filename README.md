# Caddy with Cloudflare DNS Plugin

Automated builds of Caddy with the Cloudflare DNS plugin for DNS-01 ACME challenges.

## Features

- Latest Caddy version
- Cloudflare DNS plugin pre-installed
- Multi-architecture support (amd64, arm64)
- Automatically updated weekly

## Usage

### Docker Compose
```yaml
services:
  caddy:
    image: your-dockerhub-username/caddy-cloudflare:latest
    container_name: caddy
    restart: unless-stopped
    ports:
      - 80:80
      - 443:443
      - 443:443/udp
    volumes:
      - /mnt/user/appdata/caddy/caddy:/etc/caddy
      - /mnt/user/appdata/caddy/config:/config
      - /mnt/user/appdata/caddy/data:/data
    environment:
      - TZ=America/Los_Angeles
      - CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}
```

### Caddyfile Example
```
yourdomain.com {
    tls {
        dns cloudflare {env.CLOUDFLARE_API_TOKEN}
    }
    reverse_proxy your-app:port
}
```

## Building Locally
```bash
docker build -t caddy-cloudflare .
```

## Updates

This image is automatically rebuilt weekly to include the latest Caddy updates.

## AI Disclaimer

This project was created with assistance from Claude (Anthropic). While the code has been reviewed and tested, users should:
- Review the Dockerfile and workflows before use
- Test thoroughly in non-production environments first
- Verify security configurations for their specific use case
- Keep dependencies updated regularly

This is provided as-is without warranty. Use at your own risk.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

This Docker image includes:
- [Caddy](https://github.com/caddyserver/caddy) - Apache 2.0
- [caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare) - Apache 2.0

## Disclaimer

This is an unofficial build. For official Caddy images, see [Docker Hub](https://hub.docker.com/_/caddy).

## Support

For issues specific to this build, please open an issue on GitHub.
For Caddy-related questions, see the [Caddy Community Forum](https://caddy.community/).
