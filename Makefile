all:
		mkdir -p  /home/${USER}/data/wordpress /home/${USER}/data/mariadb
		docker-compose -f srcs/docker-compose.yml up --build -d
