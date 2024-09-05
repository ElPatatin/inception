SYSTEM = $(shell uname)

# ANSI color codes
RESET=\033[0m
RED=\033[31m
GREEN=\033[32m
YELLOW=\033[33m
BLUE=\033[34m

all:
	@$(MAKE) up

up:
	@mkdir -p /home/$(USER)/data/db
	@mkdir -p /home/$(USER)/data/wordpress
	@echo "$(GREEN)[INFO]$(RESET) Starting Docker containers..."
	@docker-compose -f ./srcs/docker-compose.yaml up -d --build
	@echo "$(GREEN)[SUCCESS]$(RESET) Containers are up and running."

down:
	@echo "$(YELLOW)[INFO]$(RESET) Stopping and removing Docker containers..."
	@docker-compose -f ./srcs/docker-compose.yaml down
	@echo "$(GREEN)[SUCCESS]$(RESET) Containers stopped and removed."

clean:
	@echo "$(YELLOW)[INFO]$(RESET) Cleaning up Docker resources..."
	@$(MAKE) docker-stop docker-rmi docker-volume-rm

fclean:
	@echo "$(YELLOW)[INFO]$(RESET) Performing a full clean..."
	@$(MAKE) -s down
	@$(MAKE) -s clean
	@echo "$(GREEN)[SUCCESS]$(RESET) Full cleanup complete."

docker-stop:
ifeq ($(shell docker ps -qa),)
	@echo "$(YELLOW)[INFO]$(RESET) No containers running."
else
	@docker stop $$(docker ps -qa) 2>/dev/null
	@echo "$(GREEN)[SUCCESS]$(RESET) All containers stopped."
	@docker rm $$(docker ps -qa) 2>/dev/null
	@echo "$(GREEN)[SUCCESS]$(RESET) All containers removed."
endif

docker-rmi:
ifeq ($(shell docker image ls -qa),)
	@echo "$(YELLOW)[INFO]$(RESET) No images to remove."
else
	@docker image rm -f $$(docker image ls -qa)
	@echo "$(GREEN)[SUCCESS]$(RESET) All images removed."
endif

docker-volume-rm:
ifeq ($(shell docker volume ls -q),)
	@echo "$(YELLOW)[INFO]$(RESET) No volumes to remove."
else
	@docker volume rm $$(docker volume ls -q) 2>/dev/null
	@echo "$(GREEN)[SUCCESS]$(RESET) All volumes removed."
endif

docker-network-rm:
ifeq ($(shell docker network ls -q),)
	@echo "$(YELLOW)[INFO]$(RESET) No networks to remove."
else
	@docker network rm $$(docker network ls -q) 2>/dev/null
	@echo "$(GREEN)[SUCCESS]$(RESET) All networks removed."
endif

re:
	@echo "$(YELLOW)[INFO]$(RESET) Rebuilding the project..."
	@$(MAKE) -s fclean
	@$(MAKE) -s all
	@echo "$(GREEN)[SUCCESS]$(RESET) Rebuild complete."

.PHONY: all up down clean fclean re docker-stop docker-rmi docker-volume-rm docker-network-rm
