all:
	@$(MAKE) up

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@$(MAKE) docker-stop docker-rm docker-rmi docker-volume-rm docker-network-rm

docker-stop:
ifeq ($(shell docker ps -q),)
	@echo "No containers running"
else
	@docker stop $$(docker ps -q)
	@echo "All containers stopped"
endif

docker-rm:
ifeq ($(shell docker ps -a -q),)
	@echo "No containers to remove"
else
	@docker rm $$(docker ps -a -q)
	@echo "All containers removed"
endif

docker-rmi:
ifeq ($(shell docker images -q),)
	@echo "No images to remove"
else
	@docker rmi -f $$(docker images -q)
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

.PHONY: all up down clean re docker-stop docker-rm docker-rmi docker-volume-rm docker-network-rm
