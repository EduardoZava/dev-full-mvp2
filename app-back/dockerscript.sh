mkdir temp
cd temp
git clone https://github.com/EduardoZava/dev-full-mvp2.git
cd dev-full-mvp2/app-back
sudo docker build -t app-back .
sudo docker run -d -p 4000:4000 app-back
cd ../
rm -rf temp
