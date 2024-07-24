#frontend
dnf module disable nginx -y


dnf module enable nginx:1.24 -y

dnf install nginx -y

cp nginx.conf /etc/nginx/nginx.conf
rm -rf /usr/share/nginx/html/*


#PRINT download the application
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >>$LOG_FILE


#PRINT ectract the application
cd /usr/share/nginx/html >>$LOG_FILE
unzip /tmp/frontend.zip >>$LOG_FILE


#PRINT restart nginx
systemctl enable nginx >>$LOG_FILE
systemctl restart nginx >>$LOG_FILE
