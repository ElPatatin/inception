# Use the slim version of Debian for a lightweight base image
FROM debian:11-slim

# Install the necessary packages
RUN apt-get update && apt-get install -yy \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Copy the custom MariaDB configuration file
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

# Expose the default MariaDB port
EXPOSE 3306

# Set MariaDB to run in the foreground by default
CMD ["mysqld", "--user=mysql", "--console"]
