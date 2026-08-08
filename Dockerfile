FROM php:7.4-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html

# Copy application
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Clean up unnecessary files
RUN rm -rf /var/www/html/.git* && \
    rm -rf /var/www/html/Dockerfile && \
    rm -rf /var/www/html/docker-compose.yml && \
    rm -rf /var/www/html/railway.* && \
    rm -rf /var/www/html/.env*

# Enable mod_rewrite only
RUN a2enmod rewrite

# Disable all extra modules that might conflict
RUN a2dismod mpm_worker mpm_event 2>/dev/null || true

EXPOSE 80

CMD ["apache2-foreground"]
