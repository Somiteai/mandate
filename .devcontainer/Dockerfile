FROM node:22-bookworm

# Non-root user so npm in the project cannot run as root inside the container.
RUN groupadd --gid 1000 mandate \
  && useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash mandate

USER mandate
WORKDIR /workspace
