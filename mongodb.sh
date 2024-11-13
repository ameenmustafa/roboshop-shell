cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y
systemctl enable mongod
systemctl start mongod
 # we should change 127.0.0.0 to 0.0.0.0 in the file