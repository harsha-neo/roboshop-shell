#frontend
source common.sh
component=frontend

PRINT Disable nginx default version
dnf module disable nginx -y >>$LOG_FILE
STAT $?

PRINT enable nginx version24
dnf module enable nginx:1.24 -y >>$LOG_FILE
STAT $?

PRINT installing nginx
dnf install nginx -y >>$LOG_FILE
STAT $?

PRINT copy nginx
cp nginx.conf /etc/nginx/nginx.conf >>$LOG_FILE
STAT $?

PRINT Remove the old content
rm -rf /usr/share/nginx/html/* >>$LOG_FILE
STAT $?

PRINT download the application
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >>$LOG_FILE
STAT $?

PRINT ectract the application
cd /usr/share/nginx/html >>$LOG_FILE
unzip /tmp/frontend.zip >>$LOG_FILE
STAT $?

PRINT restart nginx
systemctl enable nginx >>$LOG_FILE
systemctl restart nginx >>$LOG_FILE
STAT $?