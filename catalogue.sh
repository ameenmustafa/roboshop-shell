echo -e "\e[36m>>>>>>>>>>>>>>> disable node js version <<<<<<<<<<<<<\e[0m"
dnf module disable nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>> enabling node js 18th version <<<<<<<<<<<<<\e[0m"
dnf module enable nodejs:18 -y

echo -e "\e[36m>>>>>>>>>>>>>>> installing node js 18th version <<<<<<<<<<<<<\e[0m"
dnf install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>> adding username roboshop <<<<<<<<<<<<<\e[0m"
useradd roboshop

rm -rf /app

echo -e "\e[36m>>>>>>>>>>>>>>> making app directory <<<<<<<<<<<<<\e[0m"
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>> app zip files downloading in curl <<<<<<<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip

echo -e "\e[36m>>>>>>>>>>>>>>> changing directory to /app <<<<<<<<<<<<<\e[0m"
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>> unzipping the app files <<<<<<<<<<<<<\e[0m"
unzip /tmp/catalogue.zip

echo -e "\e[36m>>>>>>>>>>>>>>> chaning the directory to /app <<<<<<<<<<<<<\e[0m"
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>> installing npm <<<<<<<<<<<<<\e[0m"
npm install

echo -e "\e[36m>>>>>>>>>>>>>>> coping catalogue service file to the directory <<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36m>>>>>>>>>>>>>>> demon reload <<<<<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[36m>>>>>>>>>>>>>>> enabling catalogue <<<<<<<<<<<<<\e[0m"
systemctl enable catalogue

echo -e "\e[36m>>>>>>>>>>>>>>> stating catalogue <<<<<<<<<<<<<\e[0m"
systemctl start

echo -e "\e[36m>>>>>>>>>>>>>>> coping manogdb ropo to the directory <<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>>>>>>>>> installing the mangodb org <<<<<<<<<<<<<\e[0m"
dnf install mongodb-org-shell -y

echo -e "\e[36m>>>>>>>>>>>>>>> adding domain name to the mongohost <<<<<<<<<<<<<\e[0m"
mongo --host mongodb.wecandev.xyz </app/schema/catalogue.js