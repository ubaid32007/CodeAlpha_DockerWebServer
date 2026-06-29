# ──────────────────────────────────────────────────
# CodeAlpha DevOps Internship — Task 4
# Web Server using Docker
# ──────────────────────────────────────────────────

# Base image: Nginx on Alpine Linux (lightweight)
FROM nginx:alpine

# Metadata
LABEL maintainer="CodeAlpha Intern"
LABEL description="Task 4 - Web Server using Docker"
LABEL version="1.0"

# Remove default Nginx webpage
RUN rm -rf /usr/share/nginx/html/*

# Copy our website files into the container
COPY index.html /usr/share/nginx/html/index.html

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 inside the container
EXPOSE 80

# Health check — Docker will monitor if Nginx is alive
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Start Nginx in foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
