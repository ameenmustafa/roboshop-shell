echo -e "\e[36m>>>>>>>>>>>>>>> 1 <<<<<<<<<<<<<\e[0m"
dnf install maven -y

echo -e "\e[36m>>>>>>>>>>>>>>> 2 <<<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>>> 3 <<<<<<<<<<<<<\e[0m"
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>> 4 <<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip

echo -e "\e[36m>>>>>>>>>>>>>>> 5 <<<<<<<<<<<<<\e[0m"
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>> 6 <<<<<<<<<<<<<\e[0m"
unzip /tmp/shipping.zip

echo -e "\e[36m>>>>>>>>>>>>>>> 7 <<<<<<<<<<<<<\e[0m"
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>> 8 <<<<<<<<<<<<<\e[0m"
mvn clean package

echo -e "\e[36m>>>>>>>>>>>>>>> 9 <<<<<<<<<<<<<\e[0m"
mv target/shipping-1.0.jar shipping.jar

echo -e "\e[36m>>>>>>>>>>>>>>> 10 <<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/shipping.service /etc/systemd/system/shipping.service

echo -e "\e[36m>>>>>>>>>>>>>>> 11 <<<<<<<<<<<<<\e[0m"
systemctl daemon-reload

echo -e "\e[36m>>>>>>>>>>>>>>> 12 <<<<<<<<<<<<<\e[0m"
systemctl enable shipping

echo -e "\e[36m>>>>>>>>>>>>>>> 13 <<<<<<<<<<<<<\e[0m"
systemctl start shipping

echo -e "\e[36m>>>>>>>>>>>>>>> 14 <<<<<<<<<<<<<\e[0m"
dnf install mysql -y

echo -e "\e[36m>>>>>>>>>>>>>>> 15 <<<<<<<<<<<<<\e[0m"
mysql -h mysql.wecandev.xyz -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[36m>>>>>>>>>>>>>>> 16 <<<<<<<<<<<<<\e[0m"
systemctl restart shipping