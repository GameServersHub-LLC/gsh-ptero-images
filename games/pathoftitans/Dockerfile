FROM --platform=$TARGETOS/$TARGETARCH ubuntu:24.04

LABEL author="Mike H" maintainer="m.harrison@gameservershub.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

## Add container user
RUN useradd -m -d /home/container -s /bin/bash container

## Update base packages
RUN apt update && apt upgrade -y && \
    apt install -y \
        build-essential \
        git \
        wget \
        curl \
        tar \
        zip \
        unzip \
        sqlite3 \
        locales \
        tini \
        tzdata \
        iproute2 \
        net-tools \
        libicu-dev && \
    apt clean && rm -rf /var/lib/apt/lists/*

## Configure locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## Install rcon
RUN cd /tmp/ && \
    curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz > rcon.tar.gz && \
    tar xvf rcon.tar.gz && \
    mv rcon-0.10.3-amd64_linux/rcon /usr/local/bin/ && \
    rm -rf rcon.tar.gz rcon-0.10.3-amd64_linux


## Switch to non-root user
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

## Set stop signal
STOPSIGNAL SIGINT

## Add entrypoint script
COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

## Set tini as the entrypoint
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]
