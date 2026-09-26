FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        libgcc-s1 \
        libstdc++6 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/metacivic
COPY server/ ./server/

RUN chmod +x ./server/ResearchUpperLimbServer.x86_64 \
    && if [ -f ./server/UnityCrashHandler64 ]; then chmod +x ./server/UnityCrashHandler64; fi

# Render supplies PORT at runtime (10000 by default). Unity reads it directly.
ENV PORT=10000 \
    HOME=/tmp \
    TMPDIR=/tmp

EXPOSE 10000/tcp
USER 10001:10001
STOPSIGNAL SIGTERM

ENTRYPOINT ["./server/ResearchUpperLimbServer.x86_64"]
CMD ["-batchmode", "-nographics", "-logFile", "-"]
