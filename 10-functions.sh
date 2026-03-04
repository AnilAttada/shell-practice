#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "run with root access"
    exit 1
else 
    echo "running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "$2 is installed....SUCCESS"
else   
    echo "$2 is not installed.....FAILURE"
fi

}
dnf list installed httpd

if [ $? -ne 0 ]
then
    echo "httpd is not installed......going to install"
dnf install httpd -y
VALIDATE $? "httpd"
else
    echo "httpd is installed...already present"
fi