source common.sh

PRINT copy mongo
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>LOG_FILE
STAT$?

PRINT installing mongo
dnf install mongodb-org -y &>>LOG_FILE
STAT$?

PRINT enable mongo
systemctl enable mongod &>>LOG_FILE
systemctl start mongod &>>LOG_FILE
STAT$?

PRINT mongo sed
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>LOG_FILE
STAT$?

PRINT restart mongo
systemctl restart mongod &>>LOG_FILE
STAT$?