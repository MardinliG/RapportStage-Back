FROM php:8.2-cli

# Installer les extensions nécessaires
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev

RUN docker-php-ext-install pdo pdo_pgsql sodium

RUN mkdir -p /app/config/secrets/prod

# Installer Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . /app

RUN composer install --no-interaction --optimize-autoloader --no-scripts --no-dev

EXPOSE 10000
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]