FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ARG UID
ARG GID
ARG USERNAME

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    ca-certificates \
    git \
    python3 \
    python3-pip \
 && if getent passwd ${UID}; then \
        OLDUSER=$(getent passwd ${UID} | cut -d: -f1); \
        usermod -l ${USERNAME} ${OLDUSER}; \
        usermod -d /home/${USERNAME} -m ${USERNAME}; \
    else \
        groupadd -g ${GID} ${USERNAME} || true; \
        useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME}; \
    fi \
 && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# VS Code / docker start 対応（絶対に終了しない）
CMD ["sleep", "infinity"]

# docker build \
# --build-arg UID=$(id -u) \
#   --build-arg GID=$(id -g) \
#   --build-arg USERNAME=$(id -un) \
#   -t ubuntu-user .

# docker run -d --name ubuntu-dev ubuntu-user