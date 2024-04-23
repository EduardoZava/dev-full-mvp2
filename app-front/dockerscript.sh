mkdir temp
cd temp
git clone https://github.com/EduardoZava/dev-full-mvp2.git
cd dev-full-mvp2/app-front
sudo docker build -t app-front .
sudo docker run -d -p 8080:8080 app-back  
cd ../../..          
rm -rf temp