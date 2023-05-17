# Inception

#guide
1.  Install VM with ssh + xfce (1)
	https://github.com/codesshaman/inception/
2.  login root
3.  apt update
4.  apt install -y make, ufw
5.  Install docker from a package: 
	Download the necessary repositories for Debian from the official site Docker: 
	https://docs.docker.com/engine/install/debian/ (Install from a package)
6.  Install Alpine on the Docker container
	sudo docker pull alpine
	docker images

#Docker commands exemples

docker run hello-world (checking if docker works)

docker build -t pj/ping:1 . (build = construire image; 1 = tag)
!= 
docker rmi pj/ping:1 (remove image “pj/ping:1”)

docker run  pj/ping:1 (running new image, if you do run X 2 it runs 2 separate images)

docker stats (checking how many dockers are running right now)

#delete all lines / 3 lines of docker images
docker images | awk '{print $3}' | xargs docker rmi
#afficher
docker images | awk '{print $3}' | xargs echo
#chercher contenaires actives
docker ps -a
#supprimer conteneur
docker rm [nom de docker] OU [ID de docker]
#creer un conteneur
docker run -d alpine ping google.fr # option -d fait deamoniser (deamonise) mettre en service
docker ps # on voit conteneur tourner
docker stats #voir les untilisations de CPU en temps reel
docker --help #aide commandes docker
docker ps --help #aide flags docker
docker stop id/nom
docker start id/nom
docker logs nom_conteneur #affiche les logs d'un conteneur
docker ps -a | awk '{print $1}' |wargs docker rm #remove all containers
#script examples

root@inception:~# touch test.sh

	#!/bin/sh

	ping $SCRIPT_URL -c $SCRIPT_COUNT

root@inception:~# chmod 777 test.sh
root@inception:~# export SCRIPT_URL="google.fr"
root@inception:~# export SCRIPT_COUNT=4
root@inception:~# echo $SCRIPT_URL
root@inception:~# ./test.sh

Regles de mommage d’image DOCKER : user_name/Image_name:tag

