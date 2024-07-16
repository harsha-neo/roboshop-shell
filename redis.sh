dnf module disable redis -y
dnf module enable redis:7 -y
dnf install redis -y
# update redis conf file
systemctl enable redis
systemctl start redis