#
FROM debian:11.7

# Expose port
EXPOSE 9000

# Install dependencies
RUN apt-get update && apt-get install -y \
    # php7.4 \
    # php7.4-cli \
    # php7.4-cgi \
    php7.4-fpm \
    php7.4-mysqli \
    curl \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*


# Install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Create directories
RUN mkdir -p /run/php \
  && chmod 755 /run/php
  # && chown -R www-data:www-data /run/php

# Copy custom configuration
COPY ./conf/wp.conf /etc/php/7.4/fpm/pool.d/wordpress_pool.conf
RUN chmod 644 /etc/php/7.4/fpm/pool.d/wordpress_pool.conf

# Entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Go to the working directory
WORKDIR /var/www/html

# Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
