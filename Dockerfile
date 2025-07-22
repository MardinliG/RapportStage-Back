FROM php:8.2-cli

# Installer les extensions nécessaires
RUN apt-get update && apt-get install -y \
    mkdir -p /app/config/secrets/prod
    git \
    unzip \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql sodium

# Installer Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Copie tout le projet d'un coup
COPY . /app

# Installer les dépendances
RUN composer install --no-interaction --optimize-autoloader --no-scripts --no-dev

EXPOSE 10000
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]