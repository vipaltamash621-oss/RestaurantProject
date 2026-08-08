# Use official PHP image with Apache
FROM php:7.4-apache

# Install required extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Disable all MPM modules first
RUN a2dismod mpm_event || true && \
    a2dismod mpm_worker || true && \
    a2dismod mpm_prefork || true

# Now enable only mpm_prefork
RUN a2enmod mpm_prefork && \
    a2enmod rewrite

# Copy project files
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Remove Docker and config files from web root
RUN rm -f /var/www/html/Dockerfile && \
    rm -f /var/www/html/docker-compose.yml && \
    rm -f /var/www/html/.gitignore && \
    rm -f /var/www/html/.dockerignore && \
    rm -f /var/www/html/railway.* && \
    rm -f /var/www/html/.env* && \
    rm -rf /var/www/html/.git

EXPOSE 80

CMD ["apache2-foreground"]
