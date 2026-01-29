ARG PHP_VERSION=8.5.1
FROM dunglas/frankenphp:php${PHP_VERSION}-alpine

# Install system dependencies
RUN apk upgrade --no-cache && \
    apk add --no-cache \
    acl \
    file \
    gettext \
    git \
    postgresql-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    && docker-php-ext-install \
    pdo \
    pdo_pgsql

# Install PHP extensions
RUN set -eux; \
    install-php-extensions \
    @composer \
    pdo_mysql \
    pdo_pgsql \
    apcu \
    gd \
    intl \
    opcache \
    zip \
    bcmath \
    ;

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1