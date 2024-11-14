echo -e "\e[36m>>>>>>>>>>>>>>> Install repo <<<<<<<<<<<<<\e[0m"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[36m>>>>>>>>>>>>>>> enable redis 6.2 <<<<<<<<<<<<<\e[0m"
dnf module enable redis:remi-6.2 -y

echo -e "\e[36m>>>>>>>>>>>>>>> Install redis <<<<<<<<<<<<<\e[0m"
dnf install redis -y
# 127.0.0.0 to 0.0.0.0
# vim /etc/redis.conf
# vim /etc/redis/redis.conf

sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf

echo -e "\e[36m>>>>>>>>>>>>>>> Enable redis <<<<<<<<<<<<<\e[0m"
systemctl enable redis

echo -e "\e[36m>>>>>>>>>>>>>>> Start redis <<<<<<<<<<<<<\e[0m"
systemctl start redis