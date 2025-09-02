FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    git
&& rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir PyYAML
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]