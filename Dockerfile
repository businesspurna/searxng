FROM searxng/searxng:latest

USER root

# 1. Dummy fix to keep SnapDeploy's automated proxy injector happy
RUN mkdir -p /etc/apt/apt.conf.d/

# 2. Install redis and supervisor using Alpine's native package manager (apk)
RUN apk add --no-cache redis supervisor

# 3. Copy configuration files
COPY supervisord.conf /etc/supervisord.conf
COPY searxng/settings.yml /etc/searxng/settings.yml

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]