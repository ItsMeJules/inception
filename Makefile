NAME = inception

all:	inception

${NAME}: volume build up

build:
		sudo docker compose -f srcs/docker-compose.yml build
up:
		sudo mkdir -p /home/jpeyron/
		sudo mkdir -p /home/jpeyron/data
		sudo mkdir -p /home/jpeyron/data/db-data
		sudo mkdir -p /home/jpeyron/data/web-data
		sudo docker compose -f srcs/docker-compose.yml up -d --remove-orphans
down:
		sudo docker compose -f srcs/docker-compose.yml down
stop:
		sudo docker compose -f srcs/docker-compose.yml stop
rm: stop
		sudo docker-compose -f srcs/docker-compose.yml rm
clean: rm
		sudo docker rmi mariadb
		sudo docker rmi nginx
		sudo docker rmi wordpress

re: clean ${NAME}

.PHONY: all clean fclean re bonus