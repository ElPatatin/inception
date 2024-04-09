FROM	debian:bullseye

# Installation of nginx
RUN	sudo apt-get update
RUN	sudo apt-get install -yy nginx openssl

# Copy the configuration to the container
COPY	./conf/nginx.conf /etc/nginx/conf.d
