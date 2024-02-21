COMPOSE_FILE= ./src/docker-compose.yml

all: start

start: create_volumes
		sudo docker compose -f ${COMPOSE_FILE} up -d

stop:
		sudo docker compose -f ${COMPOSE_FILE} down

restart: stop start

shell:
		cd ./src/ && \
		sudo docker compose exec -it ${ARGS} /bin/sh

ps:
	cd ./src/ && \
	sudo docker compose ps -a

net:
	cd ./src/ && \
	sudo docker network ls

boom: stop
	sudo docker system prune -f -a

images:
	cd ./src/ && \
	sudo docker images

prune_images:
	cd ./src/ && \
	sudo docker image prune -f -a

purge_images: stop prune_images

f_purge: purge_images purge_volumes

reset: f_purge reset_volumes

create_volumes:
	sudo mkdir -p /home/asouchet/data/wordpress
	sudo mkdir -p /home/asouchet/data/mariadb

purge_volumes:
	sudo rm -rf /home/asouchet/data/wordpress
	sudo rm -rf /home/asouchet/data/mariadb

reset_volumes: purge_volumes create_volumes