FROM ubuntu:latest

WORKDIR /tmp

RUN echo "$HOSTNAME" > /etc/hostname

RUN apt-get update && \
    apt-get install -y \
        bash \
        xz-utils \
        ca-certificates \
        tzdata \
        libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

COPY ./Comet_Backup-25.5.0.run ./
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN chmod +x ./Comet_Backup-25.5.0.run

CMD ["/entrypoint.sh"]