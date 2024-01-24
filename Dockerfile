FROM ruby:3.2
MAINTAINER Samuel Cochran <sj26@sj26.com>

# Use --build-arg VERSION=... to override
# or `rake docker VERSION=...`
ARG VERSION=0.9.0

RUN apt-get update
RUN apt-get install -y --no-install-recommends libsqlite3-0 libsqlite3-dev && \
    gem install mailcatcher -v "$VERSION"

EXPOSE 1025 1080

# ENTRYPOINT ["mailcatcher", "--foreground"]
# CMD ["--ip", "0.0.0.0"]
