# Use the official Caddy builder image
FROM caddy:builder AS builder

# Build Caddy with Cloudflare DNS plugin
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# Use the official Caddy image as base
FROM caddy:latest

# Copy the custom built Caddy binary from builder
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Verify the binary works
RUN caddy version

# Expose standard Caddy ports
EXPOSE 80 443 443/udp 2019

# Use the default Caddy command
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
