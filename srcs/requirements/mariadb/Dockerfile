# Use Debian as a base image
FROM debian:11-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*


# Copy the MariaDB configuration file
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/init.cnf

# Copy the entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Create necessary directories and set permissions
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 775 /var/run/mysqld

# Expose the default MariaDB port
EXPOSE 3306

# Command to run MariaDB in the foreground
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]