FROM ruby:3.2
MAINTAINER Samuel Cochran <sj26@sj26.com>

# Use --build-arg VERSION=... to override
# or `rake docker VERSION=...`
ARG VERSION=0.9.0

RUN apk add --no-cache build-base sqlite-libs sqlite-dev && \
    gem install mailcatcher -v "$VERSION" && \
    apk del --rdepends --purge build-base sqlite-dev

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground"]
CMD ["--ip", "0.0.0.0"]
