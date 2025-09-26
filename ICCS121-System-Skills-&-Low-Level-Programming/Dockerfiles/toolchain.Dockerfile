FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends bash ca-certificates curl procps && \
    rm -rf /var/lib/apt/lists/*

# non-root user + workspace
RUN useradd -r -u 1000 -s /usr/sbin/nologin app && \
    mkdir -p /work && chown -R app:app /work
USER app
WORKDIR /work

# keep container alive for exec
CMD ["bash","-lc","echo 'toolchain container up'; tail -f /dev/null"]

