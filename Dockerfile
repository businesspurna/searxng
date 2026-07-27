FROM searxng/searxng:latest

# Install redis and supervisor inside the container
RUN apk add --no-cache redis supervisor

# Copy configurations
COPY supervisord.conf /etc/supervisord.conf
COPY searxng/settings.yml /etc/searxng/settings.yml

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
