#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR :: run with root access $N" &>>$LOG_FILE
    exit 1
else 
    echo -e "$G running with root access $N" &>>$LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo -e "$2 is installed....$G SUCCESS $N" &>>$LOG_FILE 
else    
    echo -e "$2 is not installed..... $R FAILURE $N" &>>$LOG_FILE
fi

}
dnf list installed httpd &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "httpd is not installed......going to install" &>>$LOG_FILE
dnf install httpd -y &>>$LOG_FILE
VALIDATE $? "httpd"
else
    echo -e "httpd is installed... $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "mysql is not installed......going to install" &>>$LOG_FILE
dnf install mysql -y &>>$LOG_FILE
VALIDATE $? "mysql"
else
    echo -e "mysql is installed... $Y already installed $N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "python3 is not installed......going to install" &>>$LOG_FILE
dnf install python 3 -y &>>$LOG_FILE
VALIDATE $? "python3"
else
    echo -e "python3 is installed... $Y already installed $N" &>>$LOG_FILE
fi