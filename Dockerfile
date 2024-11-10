# Use the official PHP 8.2 FPM image
FROM php:8.2-fpm
USER root

# Set working directory
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    curl \
    && docker-php-ext-install pdo_mysql zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    if [ ! -f /usr/local/bin/composer ]; then \
        echo "Composer installation failed!"; \
        exit 1; \
    fi

# Copy existing application directory contents
COPY . .

# Install Composer dependencies
RUN composer install

# Copy entrypoint script and set permissions
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
