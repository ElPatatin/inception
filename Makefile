SYSTEM = $(shell uname)

all:
	@$(MAKE) up

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@$(MAKE) docker-stop docker-rmi docker-volume-rm docker-network-rm

docker-stop:
ifeq ($(shell docker ps -qa),)
	@echo "No containers running"
else
	ifeq ($(SYSTEM),Linux,WSL,Darwin)
		@kill -9 $$(docker inspect --format '{{.State.Pid}}' $$(docker ps -qa))
		@echo "Stopped all processes in containers"
	endif
	@docker stop $$(docker ps -qa)
	@echo "All containers stopped"
	@docker rm $$(docker ps -qa)
	@echo "All containers removed"
endif

docker-rmi:
ifeq ($(shell docker images -qa),)
	@echo "No images to remove"
else
	@docker rmi -f $$(docker images -qa)
	@echo "All images removed"
endif

docker-volume-rm:
ifeq ($(shell docker volume ls -q),)
	@echo "No volumes to remove"
else
	@docker volume rm $$(docker volume ls -q)
	@echo "All volumes removed"
endif

docker-network-rm:
ifeq ($(shell docker network ls -q),)
	@echo "No networks to remove"
else
	@docker network rm $$(docker network ls -q)
	@echo "All networks removed"
endif

re:
	@$(MAKE) -s clean
	@$(MAKE) -s all

.PHONY: all up down clean re docker-stop docker-rmi docker-volume-rm docker-network-rm
