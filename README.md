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

