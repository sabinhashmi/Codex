# -------------------------
# Docker Version Check
# -------------------------
docker -v

# -------------------------
# Basic Docker Commands
# -------------------------

# Pull an Ubuntu image
docker pull ubuntu

# Run Ubuntu container interactively (temporary)
docker run -it ubuntu

# List all Docker images
docker images

# List all containers (including stopped)
docker ps -a

# Remove a container by ID
docker rm <container_id>

# Remove an image by ID
docker rmi <image_id>

# Run container and auto-remove on exit
docker run --rm -it ubuntu

# Restart a stopped container
docker start <container_id>

# Attach to a running container
docker attach <container_id>

# -------------------------
# Fedora: Docker Installation
# -------------------------

sudo dnf install -y gnome-terminal dnf-plugins-core

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker -v

sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the docker group (allows running docker without sudo)
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker  # Refresh group membership in current session

# -------------------------
# Docker-in-Docker (DinD) Example
# -------------------------

# Run Docker daemon inside a container (privileged mode)
docker run --privileged -d --name dind-container docker:dind

# Exec into the running DinD container shell
docker exec -it dind-container sh

# Test Docker setup inside container
docker run hello-world
