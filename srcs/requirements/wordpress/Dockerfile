# Use the slim version of Debian for a lightweight base image
FROM debian:11-slim

# Set environment variables to non-interactive (avoids prompts during installation)
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    php-fpm \
    php-mysql \
    php-xml \
    php-gd \
    php-mbstring \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and install WordPress
RUN curl -o /tmp/wordpress.zip -L https://wordpress.org/latest.zip && \
    unzip /tmp/wordpress.zip -d /var/www/html && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    rm /tmp/wordpress.zip

# Copy PHP-FPM configuration file
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]
