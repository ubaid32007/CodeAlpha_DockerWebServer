# ─────────────────────────────────────────────
# Task 4: Web Server using Docker
# CodeAlpha DevOps Internship
# ─────────────────────────────────────────────

# Use official lightweight Nginx image
FROM nginx:alpine

# Set maintainer label
LABEL maintainer="CodeAlpha Intern"
LABEL task="Task 4 - Web Server using Docker"

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom HTML into the container
COPY html/ /usr/share/nginx/html/

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Health check — verifies the server is responding
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
