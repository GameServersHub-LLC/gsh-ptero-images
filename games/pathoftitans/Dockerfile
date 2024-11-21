FROM --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

LABEL author="Mike H" maintainer="m.harrison@gameservershub.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

## Add container user
RUN useradd -m -d /home/container -s /bin/bash container

## Update base packages
RUN apt update && apt upgrade -y && \
    apt install -y gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract \
    iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 libfontconfig icu-devtools libunwind8 sqlite3 \
    libsqlite3-dev libzip4 locales ffmpeg apt-transport-https init-system-helpers libcurl3-gnutls liblua5.1-0 libluajit-5.1-2 \
    libsqlite3-0 bzip2 zlib1g libevent-dev libmariadb-dev-compat libmariadb-dev libssl-dev libfluidsynth-dev libmariadb-dev \
    libicu-dev libssl3 libduktape207 libjsoncpp-dev libleveldb1d libncurses5 libncursesw5 tini tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt clean && rm -rf /var/lib/apt/lists/*

## Configure locale
RUN apt update && apt install -y locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

## Install rcon
RUN cd /tmp/ && \
    curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz > rcon.tar.gz && \
    tar xvf rcon.tar.gz && \
    mv rcon-0.10.3-amd64_linux/rcon /usr/local/bin/ && \
    rm -rf rcon.tar.gz rcon-0.10.3-amd64_linux

## Temporary fix for libssl1.1 dependency
RUN if [ "$(uname -m)" = "x86_64" ]; then \
        wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
        dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
        rm libssl1.1_1.1.0g-2ubuntu4_amd64.deb; \
    fi

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
