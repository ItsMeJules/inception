NAME = inception

all:	inception

${NAME}: build up

build:
		sudo docker-compose -f srcs/docker-compose.yml build
volume:
		sudo rm -rf /home/jpeyron/data
		sudo mkdir -p /home/jpeyron/data
		sudo mkdir -p /home/jpeyron/data/web-data
		sudo mkdir -p /home/jpeyron/data/db-data
up:
		sudo docker-compose -f srcs/docker-compose.yml up -d --remove-orphans
down:
		sudo docker-compose -f srcs/docker-compose.yml down
stop:
		sudo docker-compose -f srcs/docker-compose.yml stop
rm: stop
		sudo docker-compose -f srcs/docker-compose.yml rm
clean: rm
		sudo docker rmi srcs_mariadb
		sudo docker rmi srcs_nginx
		sudo docker rmi srcs_wordpress

re: clean ${NAME}

.PHONY: all clean fclean re bonus
