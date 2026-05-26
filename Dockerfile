FROM --platform=amd64 didstopia/base:nodejs-22-ubuntu-24.04

LABEL maintainer="Didstopia <support@didstopia.com>"

# Fixes apt-get warnings
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies. Factorio ships a self-contained headless Linux build, so
# the only extra needed is xz-utils to unpack its tarball — Node, curl, wget and
# ca-certificates all come from the base.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Setup the default timezone
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Setup the volume
RUN mkdir -p /factorio/saves
VOLUME ["/factorio"]

# Setup update checking support
ADD scraper/ /scraper/
WORKDIR /scraper
RUN npm install
WORKDIR /

# Setup scheduling support
ADD scheduler_app/ /scheduler_app/
WORKDIR /scheduler_app
RUN npm install
WORKDIR /

# Copy the Factorio scripts
ADD start_factorio.sh /start.sh
ADD check_autosave.sh /check_autosave.sh
ADD update_check.sh /update_check.sh
RUN chmod +x /start.sh /check_autosave.sh /update_check.sh

# Fix permissions
RUN chown -R 1000:1000 /factorio /scraper /scheduler_app

# Run as a non-root user by default
ENV PGID 1000
ENV PUID 1000

# Expose necessary ports
EXPOSE 34197/udp

# Setup default environment variables for the server
ENV FACTORIO_WORLD_NAME "docker"
ENV FACTORIO_SERVER_SETTINGS ""
ENV FACTORIO_PORT "34197"
ENV FACTORIO_VERSION "stable"

# Define directories to take ownership of
ENV CHOWN_DIRS "/factorio"

# Start the server
CMD [ "bash", "/start.sh" ]
