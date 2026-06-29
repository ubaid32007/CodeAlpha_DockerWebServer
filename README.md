# Task 4: Web Server using Docker
## CodeAlpha DevOps Internship

A fully containerized web server using **Docker** and **Nginx Alpine**.

---

## Project Structure
```
CodeAlpha_DockerWebServer/
├── Dockerfile          # Container build instructions
├── docker-compose.yml  # Run with one command
├── nginx.conf          # Nginx server configuration
├── index.html          # Website served by Nginx
└── README.md
```

---

## How to Run

### Prerequisites
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Start Docker Desktop before running commands

### Start the server
```bash
docker-compose up --build
```

### Open in browser
```
http://localhost:8080
```

### Stop the server
```bash
docker-compose down
```

---

## Useful Commands

```bash
# See running containers
docker ps

# View container logs
docker logs codealpha-webserver

# Check container health
docker inspect --format='{{.State.Health.Status}}' codealpha-webserver

# Enter container shell
docker exec -it codealpha-webserver sh

# Remove image
docker rmi task4-v2-webserver
```

---

## Concepts Covered
- Docker containerization basics
- Dockerfile with Nginx Alpine base image
- Container health checks
- Docker Compose orchestration
- Port mapping (8080 → 80)
- Volume mounting
- Bridge networking
- Auto-restart policy
- Container lifecycle management

---

**CodeAlpha DevOps Internship | Task 4: Web Server using Docker**
