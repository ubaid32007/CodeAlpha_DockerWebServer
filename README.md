# Task 4: Web Server using Docker — CodeAlpha DevOps Internship

## Overview
A containerized web server using **Docker** and **Nginx**. Serves a static HTML page demonstrating Docker containerization basics.

## Project Structure
```
task4-docker/
├── Dockerfile          # Container build instructions
├── docker-compose.yml  # Multi-container orchestration config
├── nginx.conf          # Custom Nginx server configuration
├── html/
│   └── index.html      # Web page served by Nginx
└── README.md
```

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed

## How to Run

### Option 1: Using Docker Compose (Recommended)
```bash
# Build and start the container
docker-compose up --build -d

# View running containers
docker-compose ps

# Check logs
docker-compose logs -f

# Stop the container
docker-compose down
```

### Option 2: Using Docker directly
```bash
# Build the image
docker build -t codealpha-webserver .

# Run the container
docker run -d -p 8080:80 --name codealpha-webserver codealpha-webserver

# Check container status
docker ps

# Check container health
docker inspect --format='{{.State.Health.Status}}' codealpha-webserver

# Stop and remove
docker stop codealpha-webserver
docker rm codealpha-webserver
```

## Access the Web Server
Open your browser and visit: **http://localhost:8080**

Health check endpoint: **http://localhost:8080/health**

## Key Docker Concepts Demonstrated
| Concept | Where Used |
|---|---|
| Base image | `FROM nginx:alpine` in Dockerfile |
| Layer caching | `COPY` commands ordered by change frequency |
| Health checks | `HEALTHCHECK` in Dockerfile + docker-compose |
| Port mapping | `-p 8080:80` maps host → container |
| Volume mounting | `./html:/usr/share/nginx/html:ro` for live reload |
| Restart policy | `restart: unless-stopped` in docker-compose |
| Networking | Custom `webnet` bridge network |

## Useful Docker Commands
```bash
# List all images
docker images

# List running containers
docker ps

# List all containers (including stopped)
docker ps -a

# View container logs
docker logs codealpha-webserver

# Execute command inside container
docker exec -it codealpha-webserver sh

# Remove image
docker rmi codealpha-webserver
```

---
**CodeAlpha DevOps Internship | Task 4**
