# Use the slim version of Debian for a lightweight base image
FROM debian:11-slim

# Install necessary packages
RUN apt-get update && apt-get install -yy \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
    -keyout /etc/nginx/ssl/cpeset-c.key \
    -out /etc/nginx/ssl/cpeset-c.crt \
    -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42Barcelona/OU=cpeset-c/CN=cpeset-c.42.fr"

# Ensure the NGINX root directory exists
RUN mkdir -p /var/www/html

# Copy the custom NGINX configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# Expose ports for HTTP and HTTPS
EXPOSE 443

# Set NGINX to run in the foreground by default
CMD ["nginx", "-g", "daemon off;"]



# OpenSSL options explained:
#	req:	This subcommand specifies that we want to use X.509 certificate
#		signing request (CSR) management. The “X.509” is a public key
#		infrastructure standard that SSL and TLS adheres to for its key
#		and certificate management. We want to create a new X.509 cert,
#		so we are using this subcommand.
#
#	-x509:	This further modifies the previous subcommand by telling the
#		utility that we want to make a self-signed certificate instead
#		of generating a certificate signing request, as would normally
#		happen.
#
#	-nodes:	This tells OpenSSL to skip the option to secure our certificate
#		with a passphrase. We need Nginx to be able to read the file,
#		without user intervention, when the server starts up.
#		A passphrase would prevent this from happening because we would
#		have to enter it after every restart.
#
#	-newkey rsa:2048:	This specifies that we want to generate a new
#				certificate and a new key at the same time. 
#
#	-days 365:	This specifies that we want to generate a new
#			certificate and a new key at the same time. 
#
#	-keyout:	This line tells OpenSSL where to place the generated
#			private key file that we are creating.
#
#	-out:	This tells OpenSSL where to place the certificate that we are
#		creating.
#
#	-subj:	This fills the "subject" at the time of craeting the key.
#		ex: C=ES means country is spain.
#