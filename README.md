# minimal-ubuntu-docker-env

## build

```bash
docker build \
--build-arg UID=$(id -u) \
--build-arg GID=$(id -g) \
--build-arg USERNAME=$(id -un) \
-t ubuntu-user .
```

## run

```bash
docker run -d --name ubuntu-dev ubuntu-user
```