cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y
systemctl enable mongod
systemctl start mongod
# edit conf file
systemctl restart mongod