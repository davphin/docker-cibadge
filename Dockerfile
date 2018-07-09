FROM composer
MAINTAINER Dave Nelson <davenelson2011@gmail.com>

RUN apk add --no-cache freetype-dev libpng-dev && \
  docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ && \
  docker-php-ext-install gd

RUN composer selfupdate && \
    composer global require dnelson/cibadge:0.0.0 && \
    ln -s /tmp/vendor/bin/cibadge /usr/local/bin/cibadge

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments.
ENTRYPOINT ["cibadge"]

CMD ["--help"]
