FROM python:3-slim

# Deal with bug in stretch install of openjdk-8-jre-headless
#  hopefully not needed in future.
RUN mkdir -p /usr/share/man/man1

RUN echo 'deb http://http.debian.net/debian stretch main contrib non-free' > \
     /etc/apt/sources.list.d/stretch.list && \
     apt-get update && \
     apt-get install -f -y --no-install-recommends openjdk-8-jre-headless && \
     rm /etc/apt/sources.list.d/stretch.list && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

RUN pip install html5validator

WORKDIR /app

CMD ["html5validator", "--root", "/app"]
