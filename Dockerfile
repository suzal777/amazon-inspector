# Use supported LTS image
FROM ubuntu:22.04

# Avoid interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Update & install only required packages with security patches
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd -m -u 10001 appuser

# Switch to non-root user
USER appuser

WORKDIR /app

CMD ["bash"]