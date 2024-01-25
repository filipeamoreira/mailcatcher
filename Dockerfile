FROM ruby:3.2
MAINTAINER Samuel Cochran <sj26@sj26.com>

# Use --build-arg VERSION=... to override
# or `rake docker VERSION=...`
ARG VERSION=0.9.0

# Set app root folder
ENV APP_ROOT /srv
WORKDIR $APP_ROOT/

# Copy source code
COPY . ./

RUN apt-get update
RUN apt-get install -y --no-install-recommends libsqlite3-0 libsqlite3-dev
RUN gem install mailcatcher -v "$VERSION"

EXPOSE 1025 1080
