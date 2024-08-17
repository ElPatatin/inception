all:
	@$(MAKE) up

up:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);

re:
	@$(MAKE) -s clean
	@$(MAKE) -s all

.PHONY: all up down clean re
