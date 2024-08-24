# Inception
### One container is not enough, we need to go deeper
### By [@cpeset-c](https://github.com/ElPatatin)

> [!IMPORTANT]
> If you want to host the wordpress on the domain https://cpeset-c.42.fr instead of https://localhost, you will need to add the line `127.0.0.1 cpeset-c.42.ft` to your /etc/hosts file.

## Table of contents

1. [Introduction](#Introduction)
2. [What is ...](#what-is-)
    1. [A Container](#a-container)
    2. [Docker](#docker)
    3. [Docker Compose](#docker-compose)
    4. [NGINX](#nginx)
    5. [Wordpress](#wordpress)
    6. [A Database](#a-database)
3. [File Structure](#file-structure)

## Introduction

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual machine.

## What is ...
### A Container

### Docker

### Docker Compose

### NGINX

### Wordpress

### A Database

## File Structure

> [!NOTE]
> The files under the bonus directory does are extra services, but not required for the project to work.

```plaintext
/root-folder/
| -- Makefile
| -- srcs/
|    | -- docker-compose.yml
|    | -- .env (not included sorry >w<)
|    | -- .dockerignore
|    | -- requirements/
|    |    | -- nginx/
|    |    |    | -- Dockerfile
|    |    |    | -- conf/
|    |    |    |    | -- nginx.conf
|    |    | -- mariadb/
|    |    |    | -- Dockerfile
|    |    |    | -- conf/
|    |    |    |    | -- custom-mariadb.cnf
|    |    | -- wordpress/
|    |    |    | -- Dockerfile
|    |    |    | -- conf/
|    |    |    |    | -- php.ini
|    |    | -- bonus/
|    |    |    | -- redis/
|    |    |    |    | -- Dockerfile
|    |    |    |    | -- conf/
|    |    |    |    |    | -- redis.conf
|    |    |    | -- ftp/
|    |    |    |    | -- Dockerfile
|    |    |    |    | -- conf/
|    |    |    | -- static-site/
|    |    |    |    | -- Dockerfile
|    |    |    |    | -- conf/
|    |    |    |    |    | -- index.html
|    |    |    | -- adminer/
|    |    |    |    | -- Dockerfile
|    |    |    |    | -- conf/
```


---
### [Go back to the start](#inception)