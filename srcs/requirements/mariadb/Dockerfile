# Use Debian as a base image
FROM debian:11.7

# Install necessary packages
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories and set permissions
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 775 /var/run/mysqld

# Copy the MariaDB configuration file
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the entrypoint script
COPY --chown=root:root --chmod=755 ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh

# Expose the default MariaDB port
EXPOSE 3306

RUN mysql_install_db

# Command to run MariaDB in the foreground
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]