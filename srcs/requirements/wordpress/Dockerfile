FROM debian:11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    php7.3 \
    php7.3-cli \
    php7.3-cgi \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-gd \
    php7.3-xml \
    php7.3-curl \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*


# Install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Create directories
RUN mkdir -p /var/www/html /run/php && \
    chown -R www-data:www-data /var/www/html /run/php

# Copy custom configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Go to the working directory
WORKDIR /var/www/html

# Expose port
EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
