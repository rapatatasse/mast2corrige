# syntax = docker/dockerfile:1

FROM ruby:3.2.2-slim-bullseye

# Install dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    pkg-config \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set working directory
WORKDIR /app

# Set development environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    BUNDLE_WITHOUT="test" \
    DEBUG_ASSETS="true"

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Create necessary directories with correct permissions
RUN mkdir -p tmp/pids tmp/cache tmp/cache/assets public/assets \
    && chmod -R 777 tmp \
    && chmod -R 777 public/assets

# Add user
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID ruby \
  && useradd -u $UID -g ruby -s /bin/bash -m ruby \
  && chown -R ruby:ruby /app

USER ruby

# Start the server
EXPOSE 8000
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "8000"]
