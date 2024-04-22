mkdir temp
cd temp
git clone https://github.com/EduardoZava/dev-full-mvp2.git
cd dev-full-mvp2/app-back
if exist [sudo docker ps -a -q --filter "name=mysql"] then 
    sudo docker stop mydb_appback
    sudo docker rm -f mydb_appback
else 
    echo "mydb_appback container not found"
    sudo docker pull mysql:8.0
endif
sudo docker run --name mydb_appback -e MYSQL_ROOT_PASSWORD=xpto1234 -d mysql:8.0
sudo docker build -t app-back .
sudo docker run -d -p 4000:4000 app-back  
cd ../../..          
rm -rf temp
