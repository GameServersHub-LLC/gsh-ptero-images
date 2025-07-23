FROM        --platform=$TARGETOS/$TARGETARCH node:12-bullseye-slim

LABEL author="Mike H" maintainer="m.harrison@gameservershub.com"

# Install system dependencies
RUN apt update \
    && apt -y install \
        ffmpeg \
        iproute2 \
        git \
        sqlite3 \
        libsqlite3-dev \
        python3 \
        python3-dev \
        ca-certificates \
        dnsutils \
        tzdata \
        zip \
        tar \
        curl \
        build-essential \
        libtool \
        iputils-ping \
        libnss3 \
        jq \
        software-properties-common \
    && useradd -m -d /home/container container \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Install global Node/NPM tools
RUN npm install npm@9.8.1 typescript ts-node @types/node --location=global

# Set user/container environment
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

# Copy entrypoint
COPY --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]