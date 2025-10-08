FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libwebp-dev libfreetype6-dev \
    libxml2-dev libzip-dev libcurl4-openssl-dev libicu-dev \
    libonig-dev build-essential pkg-config \
    libmagickcore-dev libmagickwand-dev \
    unzip git zip curl --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd \
    --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install \
    pdo_mysql mysqli dom mbstring gd zip curl intl

# Install Imagick via PECL
RUN pecl install imagick \
    && docker-php-ext-enable imagick    
    
# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html/

# Copy project files
COPY ./bedrock ./bedrock

WORKDIR /var/www/html/bedrock

# Install Bedrock dependencies
RUN composer install

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm"]
