FROM php:7.4-cli

RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php7.4 \
    php7.4-mysql \
    php7.4-pdo \
    php7.4-pdo-mysql \
    && rm -rf /var/lib/apt/lists/*

# Disable conflicting MPM modules
RUN a2dismod mpm_prefork mpm_worker mpm_event 2>/dev/null || true

# Use only mpm_prefork
RUN a2enmod mpm_prefork

# Enable rewrite
RUN a2enmod rewrite

# Set Apache to run in foreground
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html

RUN rm -rf /var/www/html/.git* /var/www/html/Dockerfile /var/www/html/docker-compose.yml /var/www/html/railway.*

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
