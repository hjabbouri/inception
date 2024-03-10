# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hjabbour <hjabbour@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 18:36:24 by hjabbour          #+#    #+#              #
#    Updated: 2023/06/25 18:45:50 by hjabbour         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include srcs/.env

WP_DIR = /home/$(LOGIN)/data/wordpress/
# WP_DIR = /Users/$(LOGIN)/data/wordpress/
WP_FILES = $(shell ls -A $(WP_DIR))
WP_CACHE = $(addprefix $(WP_DIR), $(WP_FILES))

MARIA_DIR = /home/$(LOGIN)/data/mariadb/
# MARIA_DIR = /Users/$(LOGIN)/data/mariadb/
MARIA_FILES = $(shell ls -A $(MARIA_DIR))
MARIA_CACHE = $(addprefix $(MARIA_DIR), $(MARIA_FILES))

# mkdir -p /Users/$(LOGIN)/data/wordpress
# mkdir -p /Users/$(LOGIN)/data/mariadb
all:
	mkdir -p /home/$(LOGIN)/data/wordpress
	mkdir -p /home/$(LOGIN)/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build

# mkdir -p /Users/$(LOGIN)/data/wordpress
# mkdir -p /Users/$(LOGIN)/data/mariadb
build:
	mkdir -p /home/$(LOGIN)/data/wordpress
	mkdir -p /home/$(LOGIN)/data/mariadb
	docker compose -f srcs/docker-compose.yml build

# mkdir -p /Users/$(LOGIN)/data/wordpress
# mkdir -p /Users/$(LOGIN)/data/mariadb
up:
	mkdir -p /home/$(LOGIN)/data/wordpress
	mkdir -p /home/$(LOGIN)/data/mariadb
	docker compose -f srcs/docker-compose.yml up

start:
	docker compose -f srcs/docker-compose.yml start
	
stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down
	docker compose -f srcs/docker-compose.yml down -v
	docker rm -f $(shell docker ps -aq) 2> /dev/null || true
	docker rmi -f $(shell docker images -aq) 2> /dev/null || true
	docker volume rm -f $(shell docker volume ls -q) 2> /dev/null || true
	docker network rm -f $(shell docker network ls -q) 2> /dev/null || true
	docker system prune -af 
	docker volume prune -f
	docker network prune -f
	rm -rf $(WP_CACHE)
	rm -rf $(MARIA_CACHE)

re: clean all

.PHONY: all build up start stop down clean re