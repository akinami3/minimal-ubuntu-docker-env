# minimal-ubuntu-docker-env

A minimal Ubuntu-based Docker environment that automatically creates a non-root user with the same UID/GID as the host user.

## Overview

This project provides a simple and reusable Docker environment:

- **Base Image**: Ubuntu Latest
- **Features**: 
  - Automatically creates a non-root user with the same UID/GID as the host
  - Automatic sudo configuration (no password required)
  - Basic tools pre-installed (sudo, curl, wget, vim, ca-certificates)


## Usage

### Building the Docker Image

```bash
docker build \
  --build-arg UID=$(id -u) \
  --build-arg GID=$(id -g) \
  --build-arg USERNAME=$(id -un) \
  -t ubuntu-user .
```

**Argument Explanation**:
- `UID=$(id -u)`: Retrieves the host user's UID
- `GID=$(id -g)`: Retrieves the host user's group ID
- `USERNAME=$(id -un)`: Retrieves the host user's username
- `-t ubuntu-user`: Tags the image as `ubuntu-user`

### Running the Container

```bash
docker run -it --name ubuntu-dev ubuntu-user bash
```


