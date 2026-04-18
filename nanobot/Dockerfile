FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Required by nanobot runtime (git for source install, bubblewrap for sandboxed shell tools).
RUN apt-get update && \
    apt-get install -y --no-install-recommends git bubblewrap && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -s /bin/bash nanobot

WORKDIR /opt/nanobot

# Install nanobot from source, as documented in the upstream Install section.
RUN git clone --depth 1 https://github.com/HKUDS/nanobot.git . && \
    pip install -e .

RUN mkdir -p /home/nanobot/.nanobot && \
    chown -R nanobot:nanobot /home/nanobot /opt/nanobot

USER nanobot
ENV HOME=/home/nanobot

EXPOSE 18790

ENTRYPOINT ["nanobot"]
CMD ["gateway"]
