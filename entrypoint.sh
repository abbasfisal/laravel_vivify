#!/bin/bash
# Set ownership and permissions for Laravel directories
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Run Composer install if vendor folder is missing
if [ ! -d "/var/www/html/vendor" ]; then
    composer install
fi

# Start the main process (php-fpm)
exec "$@"
