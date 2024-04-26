if [ -d temp ]; then
    rm -rf temp
fi
mkdir temp
cd temp
git clone https://github.com/EduardoZava/dev-full-mvp2.git
cd dev-full-mvp2/app-back
docker build -t app-back .
if docker network inspect my-network >/dev/null 2>&1; then
    echo "Network 'my-network' already exists"
else
    echo "Network 'my-network' does not exist creating network"
    docker network create my-network
fi
docker run -d --network my-network -p 4000:4000 app-back  
cd ../../..          
rm -rf temp
