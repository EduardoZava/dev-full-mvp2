# This script is used to build the docker image and run the container
# The script will clone the repository and if repositoty was update
# build the new image, and run the container
# If the container is already running, it will start the container
criouimagem=0
if [ -d temp ]; then
    rm -rf temp
fi
mkdir temp
cd temp
git clone https://github.com/EduardoZava/dev-full-mvp2.git
cd dev-full-mvp2/app-front
docker build -t app-front .
if docker network inspect my-network >/dev/null 2>&1; then
    echo "Network 'my-network' already exists"
else
    echo "Network 'my-network' does not exist creating network"
    docker network create my-network
fi
if docker container inspect frontend >/dev/null 2>&1; then
    echo "Container 'frontend' is already running"
    docker stop frontend
    docker rm frontend
fi
docker run --name frontend -d --network my-network -p 8080:8080 app-front
docker logs frontend
#destroy the temp folder
cd ../../..          
rm -rf temp