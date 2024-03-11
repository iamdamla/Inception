up:
	@sudo mkdir -p /Users/damlaerblang/data/wordpress
	@sudo mkdir -p /Users/damlaerblang/data/mariadb
	@sudo docker-compose -f srcs/docker-compose.yml up
	@echo "Up"

upbuild:
	@sudo mkdir -p  /Users/damlaerblang/data/wordpress
	@sudo mkdir -p  /Users/damlaerblang/data/mariadb
	@sudo docker-compose -f srcs/docker-compose.yml up -d --build
	@echo "Upbuild"

nginx:
	@sudo docker exec -it nginx bash

wordpress:
	@sudo docker exec -it wordpress bash

mariadb:
	@sudo docker exec -it mariadb bash

down:
	@sudo docker-compose -f srcs/docker-compose.yml down
	@echo "Down"

rmvolume: down
	@sudo docker system prune -f
	@sudo rm -rf  /Users/damlaerblang/data/wordpress/*
	@sudo rm -rf  /Users/damlaerblang/data/mariadb/*
	@sudo docker volume rm srcs_wordpress
	@sudo docker volume rm srcs_mariadb
	@echo "Removed volumes"

clean: down
	@sudo rm -rf  /Users/damlaerblang/data/wordpress/*
	@sudo rm -rf  /Users/damlaerblang/data/mariadb/*
	@sudo docker system prune -f
	@echo "Cleaned"

re: clean up

.PHONY: up upbuild nginx wordpress mariadb down rmvolume clean re