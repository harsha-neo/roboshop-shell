#frontend
source common.sh
component=frontend

PRINT Disable nginx default version
dnf module disable nginx -y
STAT $?

PRINT enable nginx version24
dnf module enable nginx:1.24 -y
STAT $?

PRINT installing nginx
dnf install nginx -y
STAT $?

PRINT copy nginx
cp nginx.conf /etc/nginx/nginx.conf
STAT $?

PRINT Remove the old content
rm -rf /usr/share/nginx/html/*
STAT $?

PRINT download the application
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
STAT $?

PRINT ectract the application
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
STAT $?

PRINT restart nginx
systemctl enable nginx
systemctl restart nginx
STAT $?