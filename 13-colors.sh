#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR :: run with root access $N"
    exit 1
else 
    echo "$G running with root access $N"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo -e "$2 is installed....$G SUCCESS $N"
else   
    echo -e "$2 is not installed..... $R FAILURE $N"
fi

}
dnf list installed httpd

if [ $? -ne 0 ]
then
    echo "httpd is not installed......going to install"
dnf install httpd -y
VALIDATE $? "httpd"
else
    echo -e "httpd is installed... $Y already installed $N"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed......going to install"
dnf install mysql -y
VALIDATE $? "mysql"
else
    echo -e "mysql is installed... $Y already installed $N"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed......going to install"
dnf install python 3 -y
VALIDATE $? "python3"
else
    echo -e "python3 is installed... $Y already installed $N"
fi