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
sudo docker build -t app-front .
sudo docker run -d -p 8080:8080 app-front
#destroy the temp folder
cd ../../..          
rm -rf temp