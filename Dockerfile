# OLD base image with known CVEs
FROM ubuntu:18.04

# Disable security updates (makes it worse on purpose)
RUN sed -i 's/security.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list

# Install vulnerable packages
RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        openssl \
        bash \
        libc6 \
        libssl1.1 \
    && rm -rf /var/lib/apt/lists/*

# Create a non-secure runtime pattern
RUN useradd -u 0 insecureuser

# Run as root (intentional bad practice)
USER root

CMD ["bash"]
