#!/bin/bash

# NETWORK
p () {
ping www.google.com
}


#DOCKER

#remove all images
rm_images () {
docker rmi -f $(docker images -q);
}

#remove all running containers
rm_running () {
docker kill $(docker ps -q)
}

#delete all stopper containers
rm_stopped () {
docker rm -f $(docker ps -a -q)
}

#push to pipy
pipy () {
python3 setup.py sdist bdist_wheel
python3 -m twine upload dist/*
}

"$@"
