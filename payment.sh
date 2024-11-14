
echo -e "\e[36m>>>>>>>>>>>>>>> 1 <<<<<<<<<<<<<\e[0m"
dnf install python36 gcc python3-devel -y

echo -e "\e[36m>>>>>>>>>>>>>>> 2 <<<<<<<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>>> 3 <<<<<<<<<<<<<\e[0m"
rm -rf /app

echo -e "\e[36m>>>>>>>>>>>>>>> 4 <<<<<<<<<<<<<\e[0m"
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>>> 5 <<<<<<<<<<<<<\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip

echo -e "\e[36m>>>>>>>>>>>>>>> 6 <<<<<<<<<<<<<\e[0m"
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>> 7 <<<<<<<<<<<<<\e[0m"
unzip /tmp/payment.zip

echo -e "\e[36m>>>>>>>>>>>>>>> 8 <<<<<<<<<<<<<\e[0m"
cd /app

echo -e "\e[36m>>>>>>>>>>>>>>> 9 <<<<<<<<<<<<<\e[0m"
pip3.6 install -r requirements.txt

echo -e "\e[36m>>>>>>>>>>>>>>> 10 <<<<<<<<<<<<<\e[0m"
cp rabbitmq.wecandev.xyz /etc/systemd/system/payment.service

echo -e "\e[36m>>>>>>>>>>>>>>> LAUDA <<<<<<<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl start payment
