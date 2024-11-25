echo -e "\e[36m>>>>>>>>>>>>>>> 1 <<<<<<<<<<<<<\e[0m"
script_path=$(dirname $0)

echo -e "\e[36m>>>>>>>>>>>>>>> 2 <<<<<<<<<<<<<\e[0m"
source ${script_path}/common.sh

echo -e "\e[36m>>>>>>>>>>>>>>> 30 <<<<<<<<<<<<<\e[0m"
echo $script_path

exit

echo -e "\e[36m>>>>>>>>>>>>>>> diable node versionn <<<<<<<<<<<<<\e[0m"
dnf module disable nodejs -y
echo -e "\e[36m>>>>>>>>>>>>>>> node js version set to 18 <<<<<<<<<<<<<\e[0m"
dnf module enable nodejs:18 -y
echo -e "\e[36m>>>>>>>>>>>>>>> Install nodejs <<<<<<<<<<<<<\e[0m"
dnf install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>> adding user name <<<<<<<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[36m>>>>>>>>>>>>>>> creating app direcroy <<<<<<<<<<<<<\e[0m"
mkdir /app
echo -e "\e[36m>>>>>>>>>>>>>>> app contents in zip files <<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
echo -e "\e[36m>>>>>>>>>>>>>>> change to app dir <<<<<<<<<<<<<\e[0m"
cd /app
echo -e "\e[36m>>>>>>>>>>>>>>> unzipping app file <<<<<<<<<<<<<\e[0m"
unzip /tmp/user.zip
echo -e "\e[36m>>>>>>>>>>>>>>> change to app directory <<<<<<<<<<<<<\e[0m"
cd /app
echo -e "\e[36m>>>>>>>>>>>>>>> Install npm <<<<<<<<<<<<<\e[0m"
npm install

echo -e "\e[36m>>>>>>>>>>>>>>> service files copy to user.service <<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/user.service /etc/systemd/system/user.service

echo -e "\e[36m>>>>>>>>>>>>>>> demon reload <<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
echo -e "\e[36m>>>>>>>>>>>>>>> eable service <<<<<<<<<<<<<\e[0m"
systemctl enable user
echo -e "\e[36m>>>>>>>>>>>>>>> start service <<<<<<<<<<<<<\e[0m"
systemctl start user
