dnf module disable redis -y
dnf module enable redis:7 -y
dnf install redis -y
sed -i -e '/^bind/ s/127.0.0.1/0.0.0.0/' -e '/protected-mode/ c protected-mode no' /etc/redis.conf
systemctl enable redis
systemctl start redis
systemctl restart redis