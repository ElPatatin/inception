SYSTEM = $(shell uname)

all:
	@$(MAKE) up

up:
	@mkdir -p /home/$(USER)/data/db
	@mkdir -p /home/$(USER)/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yaml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yaml down

clean:
	@$(MAKE) docker-stop docker-rmi docker-volume-rm docker-network-rm
	@sudo rm -rf /home/$(USER)/data

fclean:
	@$(MAKE) down
	@$(MAKE) clean

docker-stop:
# @kill -9 $$(docker inspect --format '{{.State.Pid}}' $$(docker ps -qa))
ifeq ($(shell docker ps -qa),)
	@echo "No containers running"
else
	@docker stop $$(docker ps -qa)
	@echo "All containers stopped"
	@docker rm $$(docker ps -qa)
	@echo "All containers removed"
endif

docker-rmi:
ifeq ($(shell docker image ls -q),)
	@echo "No images to remove"
else
	@docker rmi $$(docker image ls -q)
	@echo "All images removed"
endif

docker-volume-rm:
ifeq ($(shell docker volume ls -q),)
	@echo "No volumes to remove"
else
	@docker volume rm $$(docker volume ls -q)
	@echo "All volumes removed"
endif

re:
	@$(MAKE) -s down
	@$(MAKE) -s all

.PHONY: all up down clean re docker-stop docker-rmi docker-volume-rm docker-network-rm
