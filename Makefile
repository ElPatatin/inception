SYSTEM = $(shell uname)

all:
	@$(MAKE) up

up:
	@mkdir -p /home/$(USER)/data/db
	@mkdir -p /home/$(USER)/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@$(MAKE) docker-stop docker-rmi docker-volume-rm docker-network-rm
	@rm -rf /home/$(USER)/data

fclean:
	@$(MAKE) down
	@$(MAKE) clean

docker-stop:
ifeq ($(shell docker ps -qa),)
	@echo "No containers running"
else
	ifeq ($(SYSTEM),Linux)
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

re:
	@$(MAKE) -s down
	@$(MAKE) -s all

.PHONY: all up down clean re docker-stop docker-rmi docker-volume-rm docker-network-rm
