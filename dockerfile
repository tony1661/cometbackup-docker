FROM ubuntu:latest

WORKDIR /tmp

RUN apt-get update && \
    apt-get install -y \
        bash \
        xz-utils \
        ca-certificates \
        tzdata \
        libstdc++6 \
        wget \
    && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]