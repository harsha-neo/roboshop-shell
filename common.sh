LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE

PRINT() {
  echo &>>$LOG_FILE
  echo &>>$LOG_FILE
  echo "############### $* #############" &>>$LOG_FILE
  echo $*
}

STAT () {
  if [$ -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILURE\e[0m"
    echo
    echo "refer the log file for more information : file path : ${LOG_FILE}"
    exit $1
    fi
}

