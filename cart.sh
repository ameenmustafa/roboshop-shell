echo -e "\e[36m>>>>>>>>>>>>>>> diable node versionn <<<<<<<<<<<<<\e[0m"
dnf module disable nodejs -y
echo -e "\e[36m>>>>>>>>>>>>>>> enable node versionn 18<<<<<<<<<<<<<\e[0m"
dnf module enable nodejs:18 -y
echo -e "\e[36m>>>>>>>>>>>>>>> install node versionn <<<<<<<<<<<<<\e[0m"
dnf install nodejs -y
echo -e "\e[36m>>>>>>>>>>>>>>> adding roboshop useer <<<<<<<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[36m>>>>>>>>>>>>>>> create app dir <<<<<<<<<<<<<\e[0m"
mkdir /app
echo -e "\e[36m>>>>>>>>>>>>>>> app content in zip <<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
echo -e "\e[36m>>>>>>>>>>>>>>> cd app <<<<<<<<<<<<<\e[0m"
cd /app
echo -e "\e[36m>>>>>>>>>>>>>>> unzip app <<<<<<<<<<<<<\e[0m"
unzip /tmp/cart.zip
echo -e "\e[36m>>>>>>>>>>>>>>> cd app <<<<<<<<<<<<<\e[0m"
cd /app
echo -e "\e[36m>>>>>>>>>>>>>>> npm install <<<<<<<<<<<<<\e[0m"
npm install
echo -e "\e[36m>>>>>>>>>>>>>>> copy cart service to the dir <<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service

echo -e "\e[36m>>>>>>>>>>>>>>> start service <<<<<<<<<<<<<\e[0m"
 systemctl daemon-reload
 systemctl enable cart
 systemctl start cart