# Inception
### One container is not enough, we need to go deeper
### By [@cpeset-c](https://github.com/ElPatatin)

> [!IMPORTANT]
> If you want to host the wordpress on the domain https://cpeset-c.42.fr instead of https://localhost, you will need to add the line `127.0.0.1 cpeset-c.42.fr` to your /etc/hosts file.

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
A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

### Docker
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker's methodologies for shipping, testing, and deploying code, you can significantly reduce the delay between writing code and running it in production.

### Docker Compose
Docker Compose is a tool for defining and running multi-container applications. It is the key to unlocking a streamlined and efficient development and deployment experience.

Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.

Compose works in all environments; production, staging, development, testing, as well as CI workflows. It also has commands for managing the whole lifecycle of your application:

- Start, stop, and rebuild services
- View the status of running services
- Stream the log output of running services
- Run a one-off command on a service

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