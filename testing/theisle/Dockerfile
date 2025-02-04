FROM            --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

LABEL           author="Mike Harrison" maintainer="m.harrison@gameservershub.com"
LABEL           org.opencontainers.image.source=""
LABEL           org.opencontainers.image.licenses=MIT

ENV             DEBIAN_FRONTEND=noninteractive

## update base packages
RUN             apt update \
                && apt -y upgrade

## install dependencies
RUN             apt install -y \
                        apt-transport-https \
                        binutils \
                        bzip2 \
                        cabextract \
                        curl \
                        ffmpeg \
                        g++ \
                        gcc \
                        gdb \
                        git \
                        icu-devtools \
                        init-system-helpers \
                        iproute2 \
                        locales \
                        net-tools \
                        netcat-openbsd \
                        sqlite3 \
                        tar \
                        telnet \
                        tini \
                        unzip \
                        wget \
                        xz-utils \
                        zip \
                        zlib1g \
                        libatomic1 \
                        libc++-dev \
                        libc6 \
                        libcurl3-gnutls \
                        libfontconfig \
                        libgcc1 \
                        liblua5.1-0 \
                        libluajit-5.1-2 \
                        liblzo2-2 \
                        libmariadb-dev \
                        libsdl1.2debian \
                        libsdl2-2.0-0 \
                        libsqlite3-0 \
                        libsqlite3-dev \
                        libssl-dev \
                        libunwind8 \
                        xorg \
                        build-essential \
                        libgl1-mesa-glx \
                        libgl1-mesa-dri \
                        libvulkan1 \
                        pulseaudio \
                        git \
                        ca-certificates \
                        curl \
                        pkg-config \
                        libcurl4-openssl-dev \
                        libboost-all-dev \
                        libpulse-dev \
                        libxrandr-dev \
                        libxi-dev \
                        libx11-dev \
                        libgl-dev \
                        libudev-dev \
                        libjsoncpp-dev \
                        libopenal-dev \
                        steam

## configure locale
RUN             update-locale lang=en_US.UTF-8 \
                && dpkg-reconfigure --frontend noninteractive locales

## Install rcon
RUN cd /tmp/ && \
    curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz > rcon.tar.gz && \
    tar xvf rcon.tar.gz && \
    mv rcon-0.10.3-amd64_linux/rcon /usr/local/bin/ && \
    rm -rf rcon.tar.gz rcon-0.10.3-amd64_linux


## Setup user and working directory
RUN         useradd -m -d /home/container -s /bin/bash container
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Sets the default stop signal as wings can (currently) only send a kill or generic stop
STOPSIGNAL SIGINT

COPY        --chown=container:container ../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
