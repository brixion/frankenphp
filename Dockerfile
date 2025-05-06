FROM dunglas/frankenphp:1-php8.3

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    acl \
    file \
    gettext \
    git \
    libpq-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-install \
    pdo \
    pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN set -eux; \
    install-php-extensions \
        @composer \
        apcu \
        gd \
        intl \
        opcache \
        zip \
    ;

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
