FROM debian:11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create directories
RUN mkdir -p /var/www/html /run/php && \
    chown -R www-data:www-data /var/www/html /run/php

# Install WordPress
RUN curl -o /tmp/wordpress.zip -L https://wordpress.org/latest.zip && \
    unzip /tmp/wordpress.zip -d /var/www/html && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    rm /tmp/wordpress.zip

# Copy custom configuration
RUN mkdir -p /run/php
WORKDIR /var/www/html/

# Expose port
EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
