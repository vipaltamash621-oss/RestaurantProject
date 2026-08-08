# Use official PHP image with Apache
FROM php:7.4-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Disable conflicting MPM modules
RUN a2dismod mpm_prefork mpm_worker mpm_event || true

# Enable mpm_prefork
RUN a2enmod mpm_prefork

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy project files to Apache document root
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Remove build files
RUN rm -f /var/www/html/Dockerfile /var/www/html/docker-compose.yml

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]
