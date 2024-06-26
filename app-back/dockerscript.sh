# Check if a MySQL container is already running
if [ "$(docker ps -q -f name=mydb)" ]; then
    echo "MySQL container 'mydb' is already running"
else
    echo "MySQL container 'mydb' does not exist, creating and starting container"
    docker run --name mydb -d   -p 3306:3306 -e MYSQL_DATABASE=mydb -e MYSQL_ROOT_PASSWORD=xpto1234 -d mysql:latest
    docker network connect my-network mydb
fi
# Check if a temp folder exists and remove it
if [ -d temp ]; then
    rm -rf temp
fi
mkdir temp
cd temp
git clone https://github.com/EduardoZava/dev-full-mvp2.git
cp .env dev-full-mvp2/app-back
cd dev-full-mvp2/app-back
docker build -t app-back .
if docker network inspect my-network >/dev/null 2>&1; then
    echo "Network 'my-network' already exists"
else
    echo "Network 'my-network' does not exist creating network"
    docker network create my-network
fi

if docker ps -q -f name=backend >/dev/null 2>&1; then
    echo "Backend container is already running, stopping and recreating container"
    docker stop backend
    docker rm backend
fi

docker run --name backend -d --network my-network -p 4000:4000 app-back
docker logs backend
cd ../../..          
rm -rf temp

