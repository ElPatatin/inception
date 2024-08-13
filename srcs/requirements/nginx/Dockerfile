# Using alpine
FROM	debian:11-slim

# Installation of nginx
RUN	apt-get update
RUN	apt-get install -yy nginx openssl sudo-ldap

# Generate CSR (Certificate Signing Request) With OpenSSL
RUN	mkdir /etc/nginx/ssl
RUN	openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/nginx/ssl/cpeset-c.key \
	-out /etc/nginx/ssl/cpeset-c.crt \
	-subj "/C=ES/ST=Barcelona/L=Barcelona/O=42Barcelona/OU=cpeset-c/CN=cpeset-c"

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

# Copy the configuration to the container
COPY	./conf/nginx.conf /etc/nginx/conf.d/

# Expose the 443 port, the only one allowed by the subject
EXPOSE	443
