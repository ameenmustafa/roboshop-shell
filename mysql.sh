echo -e "\e[36m>>>>>>>>>>>>>>> module disable <<<<<<<<<<<<<\e[0m"
dnf module disable mysql -y

echo -e "\e[36m>>>>>>>>>>>>>>> mysql repo copy <<<<<<<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[36m>>>>>>>>>>>>>>> install mysql <<<<<<<<<<<<<\e[0m"
dnf install mysql-community-server -y

echo -e "\e[36m>>>>>>>>>>>>>>> enable mysql <<<<<<<<<<<<<\e[0m"
systemctl enable mysqld

echo -e "\e[36m>>>>>>>>>>>>>>> start mysql <<<<<<<<<<<<<\e[0m"
systemctl start mysqld

echo -e "\e[36m>>>>>>>>>>>>>>> setting password <<<<<<<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

echo -e "\e[36m>>>>>>>>>>>>>>> logging <<<<<<<<<<<<<\e[0m"
mysql -uroot -pRoboShop@1