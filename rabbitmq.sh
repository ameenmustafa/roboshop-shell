echo -e "\e[36m>>>>>>>>>>>>>>> 1 <<<<<<<<<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

echo -e "\e[36m>>>>>>>>>>>>>>> 2 <<<<<<<<<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

echo -e "\e[36m>>>>>>>>>>>>>>> 3 <<<<<<<<<<<<<\e[0m"
dnf install rabbitmq-server -y

echo -e "\e[36m>>>>>>>>>>>>>>> 4 <<<<<<<<<<<<<\e[0m"
systemctl enable rabbitmq-server

echo -e "\e[36m>>>>>>>>>>>>>>> 5 <<<<<<<<<<<<<\e[0m"
systemctl start rabbitmq-server

echo -e "\e[36m>>>>>>>>>>>>>>> 6 <<<<<<<<<<<<<\e[0m"
rabbitmqctl add_user roboshop roboshop123

echo -e "\e[36m>>>>>>>>>>>>>>> 7 <<<<<<<<<<<<<\e[0m"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
