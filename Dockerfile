FROM searxng/searxng:latest

USER root

# Install redis and supervisor using Debian's package manager (apt-get)
RUN apt-get update && \
    apt-get install -y --no-install-recommends redis-server supervisor && \
    rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY searxng/settings.yml /etc/searxng/settings.yml

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]