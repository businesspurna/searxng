FROM searxng/searxng:latest

USER root

# Create the apt proxy directory to pass SnapDeploy's automated build hook
RUN mkdir -p /etc/apt/apt.conf.d/

# Copy your settings file into SearXNG's expected directory
COPY searxng/settings.yml /etc/searxng/settings.yml

EXPOSE 8080